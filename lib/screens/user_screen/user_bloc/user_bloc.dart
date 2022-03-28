
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<CreateAccountEvent>((event, emit) => _createAccount(event, emit));
  }

  void _createAccount(
      CreateAccountEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(UserDone());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(UserError(error: 'Weak Password'));
      } else if (e.code == 'email-already-in-use') {
        emit(UserError(
            error: 'The account already exists for that email.'));
      }
    } catch (e) {
      emit(UserError(error: e.toString()));
    }
  }

}
