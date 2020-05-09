import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/register/bloc/register_email_bloc.dart';
import 'package:email_validator/email_validator.dart';

import 'bloc/register_email_bloc.dart';

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
    _onSignUpButtonPressed() {
      if(!cancel){
        //signup button now
        BlocProvider.of<RegisterEmailBloc>(context).add(//add to send an event to BLoC
          SignUpButtonPressed(
            username: _usernameController.text
          ),
        );
        cancel = true;
      }else{
        //cancel button now
        BlocProvider.of<RegisterEmailBloc>(context).add(SignUpCancelButtonPressed());
        cancel = false;
      }
    }

    return BlocListener<RegisterEmailBloc, LoginState>(
      listener: (context, state) {
        //snackBar is bottom status
        if (state is RegisterEmailFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }

        //login progressing
        if (state is RegisterEmailOnGoing) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('RegisterEmailOnGoing $state'),
              backgroundColor: Colors.green,
            ),
          );
        }

        //login progressing
        if (state is RegisterEmailCompleted) {
          fEmailValid = false;  //disable button
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('RegisterEmailCompleted $state'),
              backgroundColor: Colors.blue,
            ),
          );
        }
      },
      child: BlocBuilder<RegisterEmailBloc, LoginState>(
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
                  onPressed: fEmailValid? _onSignUpButtonPressed : null,
                      //state is! RegisterEmailOnGoing ? _onSignUpButtonPressed : null,
                  child: Text(cancel?'Cancel':'Sign up'),
                ),
                Container(
                  child: state is RegisterEmailOnGoing
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
