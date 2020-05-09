part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

//pass the valid email account to login
class LoginButtonPressed extends LoginEvent {
  final String username;

  const LoginButtonPressed({
    @required this.username
  });

  @override
  List<Object> get props => [username];

  @override
  String toString() =>
      'LoginButtonPressed { username: $username }';
}

//signup button is now "cancel" function.
class LoginCancelButtonPressed extends LoginEvent {}
