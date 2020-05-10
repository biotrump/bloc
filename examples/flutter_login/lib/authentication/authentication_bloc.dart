//UI sends Events to Bloc that some thing happens.
//BLoC sends State to UI to update/show UI.

import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:user_repository/user_repository.dart';

import 'package:flutter_login/authentication/authentication.dart';

import 'authentication_event.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null);

  //when flutter_bloc is created, the bloc constructor gets initialState first.
  /*Bloc() {
    _state = initialState;
    _bindEventsToStates();
  }
  */
  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  //UI sends events to Bloc.
  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield AuthenticationEula();
    }

    if (event is RegisterEmailAccount){
      yield AuthenticationRegisterEmail();
    }

    if (event is CryptoSDKIn) {
      //yield AuthenticationLoading();
      //await userRepository.persistToken(event.token);
      yield AuthenticationCryptoSDK();
    }

    if(event is CongratulationIn){
      yield AuthenticationCongratulation();
    }

    if(event is SummaryIn){
      yield AuthenticationSummary();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      //await userRepository.deleteToken();
      yield AuthenticationRegisterEmail();
    }
  }
}
