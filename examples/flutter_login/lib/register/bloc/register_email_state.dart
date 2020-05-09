part of 'register_email_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

//widget to show progress
class RegisterEmailOnGoing extends LoginState {}

class RegisterEmailCompleted extends LoginState {}

class RegisterEmailFailure extends LoginState {
  final String error;

  const RegisterEmailFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'RegisterEmailFailure { error: $error }';
}
