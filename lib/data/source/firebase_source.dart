import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseSource{

  Future<Object?> getCurrencyTopId() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    var reference = FirebaseDatabase.instance.ref('users/${currentUser!.uid}/currencyTopId');
    reference.push();
    var snapshot = await reference.get();
    return snapshot.value;
  }

  Future<Object?> getCurrencyDownId() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    DatabaseReference reference = FirebaseDatabase.instance.ref('users/${currentUser!.uid}/currencyDownId');
    var snapshot = await reference.get();
    return snapshot.value;
  }

  Future<void> setCurrencyTopId(int id) async {
    var currentUser = FirebaseAuth.instance.currentUser;
    DatabaseReference reference = FirebaseDatabase.instance.ref("users/${currentUser!.uid}");
    await reference.update({"currencyTopId": id,});
  }

  Future<void> setCurrencyDownId(int id) async {
    var currentUser = FirebaseAuth.instance.currentUser;
    DatabaseReference reference = FirebaseDatabase.instance.ref("users/${currentUser!.uid}");
    await reference.update({"currencyDownId": id,});
  }

}