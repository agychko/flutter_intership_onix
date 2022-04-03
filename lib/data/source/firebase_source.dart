import 'package:firebase_database/firebase_database.dart';

class FirebaseSource{

  Future<Object?> getCurrencyTopId() async {
    var reference = FirebaseDatabase.instance.ref('currencyTop/id');
    var snapshot = await reference.get();
    return snapshot.value;
  }

  Future<Object?> getCurrencyDownId() async {
    DatabaseReference reference = FirebaseDatabase.instance.ref('currencyDown/id');
    var snapshot = await reference.get();
    return snapshot.value;
  }

  Future<void> setCurrencyTopId(int id) async {
    DatabaseReference reference = FirebaseDatabase.instance.ref("currencyTop");
    await reference.update({"id": id,});
  }

  Future<void> setCurrencyDownId(int id) async {
    DatabaseReference reference = FirebaseDatabase.instance.ref("currencyDown");
    await reference.update({"id": id,});
  }

}