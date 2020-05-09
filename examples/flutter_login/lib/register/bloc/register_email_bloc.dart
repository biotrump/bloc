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

  RegisterEmailBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => RegisterEmailCompleted();

  @override
  Stream<LoginState> mapEventToState(RegisterEmailEvent event) async* {
    if (event is SignUpButtonPressed) {
      yield RegisterEmailOnGoing();//show loading .....

      try {
        //wait for user account authentication
        //get domain entrance

        //
        final token = await userRepository.authenticate(
          username: event.username,
        );
        //yes, authenticated, update login UI
        yield RegisterEmailCompleted();

        //do something special
        await Future.delayed(Duration(seconds: 2));
        //inform bloc to goto next page
        authenticationBloc.add(CryptoSDKIn(username: event.username, token: token));//send bloc event with token for next stage process
        //do something and goto next state
      } catch (error) {
        //no, authentication failure
        yield RegisterEmailFailure(error: error.toString());
      }
    }
  }
}
