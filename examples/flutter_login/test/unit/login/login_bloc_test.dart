import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:user_repository/user_repository.dart';

import 'package:flutter_login/authentication/authentication.dart';
import 'package:flutter_login/register/bloc/register_email_bloc.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockAuthenticationBloc extends Mock implements AuthenticationBloc {}

void main() {
  RegisterEmailBloc loginBloc;
  MockUserRepository userRepository;
  MockAuthenticationBloc authenticationBloc;

  setUp(() {
    userRepository = MockUserRepository();
    authenticationBloc = MockAuthenticationBloc();
    loginBloc = RegisterEmailBloc(
      userRepository: userRepository,
      authenticationBloc: authenticationBloc,
    );
  });

  tearDown(() {
    loginBloc?.close();
    authenticationBloc?.close();
  });

  test('throws AssertionError when userRepository is null', () {
    expect(
      () => RegisterEmailBloc(
        userRepository: null,
        authenticationBloc: authenticationBloc,
      ),
      throwsAssertionError,
    );
  });

  test('throws AssertionError when authenticationBloc is null', () {
    expect(
      () => RegisterEmailBloc(
        userRepository: userRepository,
        authenticationBloc: null,
      ),
      throwsAssertionError,
    );
  });

  test('initial state is correct', () {
    expect(RegisterEmailCompleted(), loginBloc.initialState);
  });

  test('close does not emit new states', () {
    expectLater(
      loginBloc,
      emitsInOrder([RegisterEmailCompleted(), emitsDone]),
    );
    loginBloc.close();
  });

  group('SignUpButtonPressed', () {
    blocTest(
      'emits [RegisterEmailOnGoing, RegisterEmailCompleted] and token on success',
      build: () async {
        when(userRepository.authenticate(
          username: 'valid.username',
          //password: 'valid.password',
        )).thenAnswer((_) => Future.value('token'));
        return loginBloc;
      },
      act: (bloc) => bloc.add(
        SignUpButtonPressed(
          username: 'valid.username',
          //password: 'valid.password',
        ),
      ),
      expect: [
        RegisterEmailOnGoing(),
        RegisterEmailCompleted(),
      ],
      verify: (_) async {
        verify(authenticationBloc.add(CryptoSDKIn())).called(1);
      },
    );

    blocTest(
      'emits [RegisterEmailOnGoing, RegisterEmailFailure] on failure',
      build: () async {
        when(userRepository.authenticate(
          username: 'valid.username',
          //password: 'valid.password',
        )).thenThrow(Exception('login-error'));
        return loginBloc;
      },
      act: (bloc) => bloc.add(
        SignUpButtonPressed(
          username: 'valid.username',
          //password: 'valid.password',
        ),
      ),
      expect: [
        RegisterEmailOnGoing(),
        RegisterEmailFailure(error: 'Exception: login-error'),
      ],
      verify: (_) async {
        verifyNever(authenticationBloc.add(any));
      },
    );
  });
}
