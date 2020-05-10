import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class EULAIsApprovedEvent extends AuthenticationEvent {}

//get account info from register_email_bloc.dart
class SetEmailAccountInfo extends AuthenticationEvent {
  final String token;
  final String username;
  const SetEmailAccountInfo({@required this.username, @required this.token});

  @override
  List<Object> get props => [token, username];

  @override
  String toString() => 'SetEmailAccountInfo { token: $token, username: $username }';
}

//ui->bloc
class CryptoSDKIn extends AuthenticationEvent {}
/*
  final String token;
  final String username;
  const CryptoSDKIn({@required this.username, @required this.token});

  @override
  List<Object> get props => [token, username];

  @override
  String toString() => 'CryptoSDKIn { token: $token, username: $username }';
}
*/

//ui->bloc
class CongratulationIn extends AuthenticationEvent {}

//ui->bloc
class SummaryIn extends AuthenticationEvent {}

class LoggedOut extends AuthenticationEvent {}
