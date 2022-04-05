abstract class FirebaseSource {
  Future<Object?> getCurrencyTopId();

  Future<Object?> getCurrencyDownId();

  Future<void> setCurrencyTopId(int id);

  Future<void> setCurrencyDownId(int id);
}
