import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationEula extends AuthenticationState {}
class AuthenticationRegisterEmail extends AuthenticationState {}
class AuthenticationCryptoSDK extends AuthenticationState {}

//class AuthenticationRegisterEmail extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

//bloc->ui
class AuthenticationCongratulation extends AuthenticationState {}

//bloc->ui
class AuthenticationSummary extends AuthenticationState {}