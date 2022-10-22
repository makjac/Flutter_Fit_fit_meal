import 'package:fit_fit_meal/data/controllers/base_user_controller.dart';
import 'package:fit_fit_meal/data/repository/firbase/aurh_repository.dart';
import 'package:fit_fit_meal/data/repository/model_repository/user_repository/user_repository.dart';
import 'package:fit_fit_meal/utils/user_shared_preferences.dart';

class UserController extends BaseUserController {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  UserController(
      {AuthRepository? authRepository, UserRepository? userRepository})
      : _authRepository = authRepository ?? AuthRepository(),
        _userRepository = userRepository ?? UserRepository();

  @override
  Future<void> signInUser(
      {required String email, required String passwd}) async {
    try {
      await _authRepository.signIn(email: email, passwd: passwd);
      final userUID = await _authRepository.getUID();
      _userRepository.getUser(userUID!).listen((user) async {
        await _userRepository.saveUser(user);
      });
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> signUpUser(
      {required String email, required String passwd}) async {
    try {
      await _authRepository.signUp(email: email, passwd: passwd);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> signOutUser() async {
    try {
      await _authRepository.signOut();
      await UserSharedPreferences.clearAllUserData();
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> resetUserPassword({required String email}) async {
    try {
      await _authRepository.resetPasswd(email: email);
    } catch (error) {
      throw Exception(error);
    }
  }
}
