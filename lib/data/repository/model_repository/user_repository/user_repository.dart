import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_fit_meal/data/models/user_model.dart';
import 'package:fit_fit_meal/data/repository/model_repository/user_repository/base_user_repositoru.dart';
import 'package:fit_fit_meal/utils/user_shared_preferences.dart';

class UserRepository extends BaseUserRepository {
  final FirebaseFirestore _firestore;

  UserRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Stream<UserModel> getUser(String userUID) {
    try {
      final userRef = _firestore.collection('user').doc(userUID);
      return userRef.snapshots().map((user) => UserModel.fromSnapshot(user));
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> updateUserData(UserModel user) async {
    try {
      final userRef = _firestore.collection('user').doc(user.uid);
      await userRef.update(user.toMap());
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> saveUser(UserModel user) async {
    try {
      UserSharedPreferences.setUserUID(user.uid);
      if (user.gender != null) {
        UserSharedPreferences.setUserGender(user.gender!);
        UserSharedPreferences.setUserHeight(user.height!.toDouble());
        UserSharedPreferences.setUserWeight(user.weight!.toDouble());
        UserSharedPreferences.setUserAge(user.age!.toInt());
        UserSharedPreferences.setUserPAL(user.pal!.toDouble());
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}
