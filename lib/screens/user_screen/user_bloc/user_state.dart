part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserDone extends UserState {
  final bool needToOpenConverterScreen;
  UserDone({required this.needToOpenConverterScreen});
}

class UserError extends UserState {
  final String error;

  UserError({required this.error});
}