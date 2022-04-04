import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../firebase_source.dart';

class FirebaseSourceImpl extends FirebaseSource {
  @override
  Future<Object?> getCurrencyTopId() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    var reference = FirebaseDatabase.instance
        .ref('users/${currentUser!.uid}/currencyTopId');
    reference.push();
    var snapshot = await reference.get();
    return snapshot.value;
  }

  @override
  Future<Object?> getCurrencyDownId() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    DatabaseReference reference = FirebaseDatabase.instance
        .ref('users/${currentUser!.uid}/currencyDownId');
    var snapshot = await reference.get();
    return snapshot.value;
  }

  @override
  Future<void> setCurrencyTopId(int id) async {
    var currentUser = FirebaseAuth.instance.currentUser;
    DatabaseReference reference =
        FirebaseDatabase.instance.ref("users/${currentUser!.uid}");
    await reference.update({
      "currencyTopId": id,
    });
  }

  @override
  Future<void> setCurrencyDownId(int id) async {
    var currentUser = FirebaseAuth.instance.currentUser;
    DatabaseReference reference =
        FirebaseDatabase.instance.ref("users/${currentUser!.uid}");
    await reference.update({
      "currencyDownId": id,
    });
  }
}
