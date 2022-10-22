import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_fit_meal/data/repository/firbase/base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<String?> getUID() async {
    try {
      final user = _firebaseAuth.currentUser;
      return user?.uid;
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> resetPasswd({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> signIn({required String email, required String passwd}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: passwd);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> signUp({required String email, required String passwd}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: passwd);
    } catch (error) {
      throw Exception(error);
    }
  }
}
