part of 'register_email_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class RegisterEmailUninitialized extends LoginState {}

//widget to show progress
class RegisterEmailOnGoing extends LoginState {}

class RegisterEmailCompleted extends LoginState {
  final String token;
  final String username;
  RegisterEmailCompleted({@required this.token , @required this.username});

  @override
  List<Object> get props => [token, username];

  @override
  String toString() => 'RegisterEmailCompleted { token: $token, username: $username }';

}

class RegisterEmailFailure extends LoginState {
  final String error;

  const RegisterEmailFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'RegisterEmailFailure { error: $error }';
}
