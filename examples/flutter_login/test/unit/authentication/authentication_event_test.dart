import 'package:flutter_login/authentication/authentication.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthenticationEvent', () {
    group('AppStarted', () {
      test('props are []', () {
        expect(AppStarted().props, []);
      });

      test('toString is "AppStarted"', () {
        expect(AppStarted().toString(), 'AppStarted');
      });
    });

    group('CryptoSDKIn', () {
      test('props are [token]', () {
        expect(CryptoSDKIn(token: 'token').props, ['token']);
      });

      test('toString is "CryptoSDKIn { token: token }"', () {
        expect(
          CryptoSDKIn(token: 'token').toString(),
          'CryptoSDKIn { token: token }',
        );
      });
    });

    group('LoggedOut', () {
      test('props are []', () {
        expect(LoggedOut().props, []);
      });

      test('toString is "LoggedOut"', () {
        expect(LoggedOut().toString(), 'LoggedOut');
      });
    });
  });
}
