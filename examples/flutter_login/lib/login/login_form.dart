import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/login/bloc/login_bloc.dart';
import 'package:email_validator/email_validator.dart';

import 'bloc/login_bloc.dart';

//import 'package:flutter_login/validators.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  //final _passwordController = TextEditingController();
  bool cancel=false;
  bool fEmailValid=false;

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      if(!cancel){
        //signup button now
        BlocProvider.of<LoginBloc>(context).add(//add to send an event to BLoC
          LoginButtonPressed(
            username: _usernameController.text
          ),
        );
        cancel = true;
      }else{
        //cancel button now
        BlocProvider.of<LoginBloc>(context).add(LoginCancelButtonPressed());
        cancel = false;
      }
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        //snackBar is bottom status
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }

        //login progressing
        if (state is LoginLoading) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('LoginLoading $state'),
              backgroundColor: Colors.green,
            ),
          );
        }

        //login progressing
        if (state is LoginCompleted) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('LoginCompleted $state'),
              backgroundColor: Colors.blue,
            ),
          );
        }

      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Form(
            child: Column(
              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(labelText: 'email'),
                  keyboardType: TextInputType.emailAddress,
                  autovalidate: true,
                  autocorrect: false,
                  //validator: (_) {
                  //  return !state.isEmailValid ? 'Invalid Email' : null;
                  //},
                  validator: (text) {//show result of validate email on every input
                    //return Validators.isValidEmail(text) ? null : 'Invalid Email' ;
                    fEmailValid = EmailValidator.validate(text);
                    return fEmailValid? null:"Invalid email address";
                  },
                  onChanged: (text) { //every input to check the email valid
                    //fEmailValid = EmailValidator.validate(text);
                    setState(() { //update widget
                      fEmailValid = EmailValidator.validate(text);
                    });
                  },
                ),
                /*
                TextFormField(
                  decoration: InputDecoration(labelText: 'password'),
                  controller: _passwordController,
                  obscureText: true,
                ),
                */
                RaisedButton(
                  onPressed: fEmailValid? _onLoginButtonPressed : null,
                      //state is! LoginLoading ? _onLoginButtonPressed : null,
                  child: Text(cancel?'Cancel':'Sign up'),
                ),
                Container(
                  child: state is LoginLoading
                      ? CircularProgressIndicator()
                      : null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
