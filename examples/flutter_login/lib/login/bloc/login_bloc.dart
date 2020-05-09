import 'dart:async';

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:user_repository/user_repository.dart';

import 'package:flutter_login/authentication/authentication.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginCompleted();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();//show loading .....

      try {
        //wait for user account authentication
        //get domain entrance

        //
        final token = await userRepository.authenticate(
          username: event.username,
        );
        //yes, authenticated, update login UI
        yield LoginCompleted();

        //do something special
        await Future.delayed(Duration(seconds: 2));
        //inform bloc to goto next page
        authenticationBloc.add(LoggedIn(token: token));//send bloc event with token for next stage process
        //do something and goto next state
      } catch (error) {
        //no, authentication failure
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
