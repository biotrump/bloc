import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_login/register/bloc/register_email_bloc.dart';

void main() {
  group('LoginState', () {
    group('RegisterEmailCompleted', () {
      test('props are []', () {
        expect(RegisterEmailCompleted().props, []);
      });

      test('toString is RegisterEmailCompleted', () {
        expect(RegisterEmailCompleted().toString(), 'RegisterEmailCompleted');
      });
    });

    group('RegisterEmailOnGoing', () {
      test('props are []', () {
        expect(RegisterEmailOnGoing().props, []);
      });

      test('toString is RegisterEmailOnGoing', () {
        expect(RegisterEmailOnGoing().toString(), 'RegisterEmailOnGoing');
      });
    });

    group('RegisterEmailFailure', () {
      test('props are [error]', () {
        expect(RegisterEmailFailure(error: 'error').props, ['error']);
      });

      test('toString is RegisterEmailFailure { error: error }', () {
        expect(
          RegisterEmailFailure(error: 'error').toString(),
          'RegisterEmailFailure { error: error }',
        );
      });
    });
  });
}
