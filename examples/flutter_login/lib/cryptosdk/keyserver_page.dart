import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/cryptosdk/keyserver_form.dart';
import 'package:user_repository/user_repository.dart';

import 'package:flutter_login/authentication/authentication.dart';
import 'package:flutter_login/cryptosdk/bloc/crypto.dart';

class KeyServerPage extends StatelessWidget {
  final UserRepository userRepository;

  KeyServerPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keyserver Registration'),
      ),
      body: BlocProvider(
        create: (context) { //create a new bloc for this page/widget
          return CryptoBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          )
          ..add(CryptoIn());  //UI sends an event that ui is in.
        },
        child: KeyServerForm(), //provide the bloc to its child widget
      ),
    );
  }
}
