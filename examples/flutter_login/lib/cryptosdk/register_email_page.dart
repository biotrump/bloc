import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/register/register_email_form.dart';
import 'package:user_repository/user_repository.dart';

import 'package:flutter_login/authentication/authentication.dart';
import 'package:flutter_login/register/bloc/register_email_bloc.dart';

class RegisterEmailPage extends StatelessWidget {
  final UserRepository userRepository;

  RegisterEmailPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Registration'),
      ),
      body: BlocProvider(
        create: (context) {
          return RegisterEmailBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: RegisterEmailForm(),
      ),
    );
  }
}
