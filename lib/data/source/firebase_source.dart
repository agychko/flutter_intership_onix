import 'package:firebase_database/firebase_database.dart';

class FirebaseSource{

  Future<int?> getCurrencyTopId() async {
    // var preferences = await _getPreferences();
    // return preferences.getInt(_currencyTopId);
    var ref = FirebaseDatabase.instance.ref();
    var snapshot = await ref.child('_currencyTopId').get();
  }

  Future<int?> getCurrencyDownId() async {
    // var preferences = await _getPreferences();
    // return preferences.getInt(_currencyDownId);
    // final ref = FirebaseDatabase.instance.ref();
    // var snapshot = await ref.child('_currencyDownId').get();

    DatabaseReference reference = FirebaseDatabase.instance.ref('_currencyDownId');
    var snapshot = await reference.get();
  }

  Future<void> setCurrencyTopId(int id) async {
    // var preferences = await _getPreferences();
    // preferences.setInt(_currencyTopId, id);
    DatabaseReference ref = FirebaseDatabase.instance.ref("_currencyTopId");
    await ref.update({"_currencyTopId": id,});
  }

  Future<void> setCurrencyDownId(int id) async {
    // var preferences = await _getPreferences();
    // preferences.setInt(_currencyDownId, id);
    DatabaseReference ref = FirebaseDatabase.instance.ref("_currencyDownId");
    await ref.update({"_currencyDownId": id,});
  }

}