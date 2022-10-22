abstract class BaseAuthRepository {
  Future<String?> getUID();

  Future<void> signUp({required String email, required String passwd});

  Future<void> signIn({required String email, required String passwd});

  Future<void> signOut();

  Future<void> resetPasswd({required String email});
}
