part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserLoggedIn extends UserEvent{}

class CreateUserEvent extends UserEvent {
  final String email;
  final String password;

  CreateUserEvent({required this.email, required this.password});
}

class LoginUserEvent extends UserEvent {
  final String email;
  final String password;

  LoginUserEvent({required this.email, required this.password});
}
