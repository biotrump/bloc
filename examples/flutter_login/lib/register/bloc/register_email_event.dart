part of 'register_email_bloc.dart';

abstract class RegisterEmailEvent extends Equatable {
  const RegisterEmailEvent();

  @override
  List<Object> get props => [];
}

//pass the valid email account to login
class SignUpButtonPressed extends RegisterEmailEvent {
  final String username;

  const SignUpButtonPressed({
    @required this.username
  });

  @override
  List<Object> get props => [username];

  @override
  String toString() =>
      'SignUpButtonPressed { username: $username }';
}

//signup button is now "cancel" function.
class SignUpCancelButtonPressed extends RegisterEmailEvent {}

class SignUpCompleted extends RegisterEmailEvent {}