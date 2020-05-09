import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_login/login/bloc/login_bloc.dart';

void main() {
  group('LoginState', () {
    group('LoginCompleted', () {
      test('props are []', () {
        expect(LoginCompleted().props, []);
      });

      test('toString is LoginCompleted', () {
        expect(LoginCompleted().toString(), 'LoginCompleted');
      });
    });

    group('LoginLoading', () {
      test('props are []', () {
        expect(LoginLoading().props, []);
      });

      test('toString is LoginLoading', () {
        expect(LoginLoading().toString(), 'LoginLoading');
      });
    });

    group('LoginFailure', () {
      test('props are [error]', () {
        expect(LoginFailure(error: 'error').props, ['error']);
      });

      test('toString is LoginFailure { error: error }', () {
        expect(
          LoginFailure(error: 'error').toString(),
          'LoginFailure { error: error }',
        );
      });
    });
  });
}
