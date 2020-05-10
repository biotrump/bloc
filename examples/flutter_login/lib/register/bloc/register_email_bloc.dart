import 'dart:async';

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:user_repository/user_repository.dart';

import 'package:flutter_login/authentication/authentication.dart';

part 'register_email_event.dart';
part 'register_email_state.dart';

class RegisterEmailBloc extends Bloc<RegisterEmailEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;
  String token="";
  String username="";

  RegisterEmailBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => RegisterEmailUninitialized();

  @override
  Stream<LoginState> mapEventToState(RegisterEmailEvent event) async* {
    if (event is SignUpButtonPressed) {
      yield RegisterEmailOnGoing();//show loading .....

      try {
        //wait for user account authentication
        //get domain entrance

        //
        this.username = event.username;
        this.token = await userRepository.authenticate(
          username: event.username);
        //do something special
        await Future.delayed(Duration(seconds: 2));

        //yes, authenticated, update login UI
        yield RegisterEmailCompleted(username: event.username, token: this.token);

        //do something and goto next state
      } catch (error) {
        //no, authentication failure
        yield RegisterEmailFailure(error: error.toString());
      }
    }

    if(event is SignUpCompleted ){//ui has completed!
      //1. send the user account to authentication_bloc for further progress.
      authenticationBloc.add(SetEmailAccountInfo(token:this.token, username:this.username));//send bloc event with token for next stage process
      //2. send an event to go to next page
      authenticationBloc.add(CryptoSDKIn());//send bloc event with token for next stage process
    }
  }
}
