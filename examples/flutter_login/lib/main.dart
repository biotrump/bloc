import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

import 'package:flutter_login/authentication/authentication.dart';
import 'package:flutter_login/welcome/welcome.dart';
import 'package:flutter_login/register/register_email_page.dart';
import 'package:flutter_login/cryptosdk/keyserver_page.dart';
import 'package:flutter_login/congratulation/congratulation.dart';
import 'package:flutter_login/summary/summary.dart';

import 'package:flutter_login/common/common.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  runApp(
    //procide a bloc for children.
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        //..add(AppStarted()): Notifies the [bloc] of a new [event] which triggers [mapEventToState].
        //If [close] has already been called, any subsequent calls to [add] will be delegated to the [onError]
        //method which can be overridden at the [bloc] as well as the [BlocDelegate] level.
        return AuthenticationBloc(userRepository: userRepository)
          ..add(AppStarted());  //sends a new state after the flutter_bloc is created
      },
      child: App(userRepository: userRepository),
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationRegisterEmail) {
            return RegisterEmailPage(key: ValueKey('RegisterEmailPage'), userRepository: userRepository);
          }

          if (state is AuthenticationLoading) {
            return LoadingIndicator(key: ValueKey('LoadingIndicator'));
          }

          if(state is AuthenticationCryptoSDK){
            return KeyServerPage(key: ValueKey('KeyServerPage'), userRepository: userRepository);
          }

          if (state is AuthenticationCongratulation) {
            return CongratulationPage(key: ValueKey('CongratulationPage'));
          }

          if (state is AuthenticationSummary){
            return SummaryPage(key: ValueKey('SummaryPage'), username: userRepository.username);
          }
          //default page
          //if(state is AuthenticationEula){
            return WelcomeScreen(key: ValueKey('WelcomeScreen'));  //SplashPage();
          //}
          //return null;
        },
      ),
    );
  }
}
