
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class FirebaseSource{
  @protected
  final currentUser = FirebaseAuth.instance.currentUser;

  Future<Object?> getCurrencyTopId();

  Future<Object?> getCurrencyDownId();

  Future<void> setCurrencyTopId(int id);

  Future<void> setCurrencyDownId(int id);

}