part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class CreateAccountEvent extends UserEvent {
  final String email;
  final String password;

  CreateAccountEvent({required this.email, required this.password});
}
