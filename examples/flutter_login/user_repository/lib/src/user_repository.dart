import 'dart:async';

import 'package:meta/meta.dart';

//verify, validate and authenticate user account
class UserRepository {
  //authenticate the email account
  Future<String> authenticate({
    @required String username,
    //@required String password,
  }) async {
    await Future.delayed(Duration(seconds: 5));
    //do the real authentication.
    return 'authentication succeeds to get token!';
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 5));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 5));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 5));
    return false;
  }
}
