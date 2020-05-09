import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_login/register/bloc/register_email_bloc.dart';

void main() {
  group('LoginEvent', () {
    group('SignUpButtonPressed', () {
      test('props are [username, password]', () {
        expect(
          SignUpButtonPressed(username: 'username' /*, password: 'password' */).props,
          ['username', 'password'],
        );
      });

      test(
          'toString is SignUpButtonPressed { username: username, password: password }',
          () {
        expect(
          SignUpButtonPressed(
            username: 'username',
            //password: 'password',
          ).toString(),
          'SignUpButtonPressed { username: username, password: password }',
        );
      });
    });
  });
}
