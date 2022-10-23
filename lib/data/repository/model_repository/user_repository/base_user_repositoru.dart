import 'package:fit_fit_meal/data/models/user_model.dart';

abstract class BaseUserRepository {
  Stream<UserModel> getUser(String userUID);

  Future<void> initUserDocument(String userUID);

  Future<void> updateUserData(UserModel user);

  Future<void> saveUser(UserModel user);
}
