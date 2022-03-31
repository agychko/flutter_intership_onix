
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<CreateUserEvent>((event, emit) => _createAccount(event, emit));
    on<LoginUserEvent>((event, emit) => _loginUser(event, emit));
  }

  void _createAccount(
      CreateUserEvent event, Emitter<UserState> emit) async {
    // emit(UserLoading());
    try {
      UserCredential userCredential = await
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: event.email, password: event.password);

      emit(UserDone());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(UserError(error: 'Weak Password'));
      }
      else
        if (e.code == 'email-already-in-use') {
        emit(UserError(
            error: 'The account already exists for that email.'));
      }
    } catch (e) {
      emit(UserError(error: e.toString()));
    }
  }

  void _loginUser(LoginUserEvent event, Emitter<UserState> emit) async {
    // emit(UserLoading());
    try {
      UserCredential userCredential = await
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: event.email, password: event.password);

      emit(UserDone());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(UserError(error: 'No user found for that email.'));
      } else
        if (e.code == 'wrong-password') {
        emit(UserError(error: 'Wrong password provided for that user.'));
      }
    } catch (e) {
      emit(UserError(error: e.toString()));
    }
  }
}
