abstract class BaseUserController {
  Future<void> signInUser({required String email, required String passwd});

  Future<void> signUpUser({required String email, required String passwd});

  Future<void> signOutUser();

  Future<void> resetUserPassword({required String email});
}
