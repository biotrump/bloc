import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:user_repository/user_repository.dart';

import 'package:flutter_login/authentication/authentication.dart';

import 'crypto_event.dart';
import 'crypto_state.dart';

class CryptoBloc
    extends Bloc<CryptoEvent, CryptoState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;
  CryptoBloc({ @required this.authenticationBloc, @required this.userRepository})
      : assert(userRepository != null), assert(authenticationBloc != null);

  //when flutter_bloc is created, the bloc constructor gets initialState first.
  /*Bloc() {
    _state = initialState;
    _bindEventsToStates();
  }
  */
  @override
  CryptoState get initialState => CryptoUninitialized();

  @override
  Stream<CryptoState> mapEventToState(
    CryptoEvent event,
  ) async* {
    if (event is CryptoIn) {
      //bloc->ui
      //check key server or key card???
      yield CryptoKeyServer();
    }

    if (event is CryptoOut) {
      //bloc->ui: keyserver complete
      yield CryptoCompleted();

      //wait for a moment
     await Future.delayed(Duration(seconds: 2));
      //send an event to inform bloc to goto next page
      authenticationBloc.add(CongratulationIn());
    }
  }
}
