import 'package:fit_fit_meal/screens/profile/widgets/avatar.dart';
import 'package:fit_fit_meal/utils/insets.dart';
import 'package:fit_fit_meal/utils/user_shared_preferences.dart';
import 'package:fit_fit_meal/widgets/inputDecoration/border_cross.dart';
import 'package:fit_fit_meal/widgets/menu/menu_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //final String? _login = UserSharedPreferences.getUserLogin();
  final bool? _gender = UserSharedPreferences.getUserGender();

  final TextEditingController _loginController =
      TextEditingController(text: UserSharedPreferences.getUserLogin());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text(
          "Profile",
        ),
        centerTitle: true,
        leading: const MenuWidget(),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(Insets.s),
            child: _loginField(),
          ),
        ],
      ),
    );
  }

  String _lottePath() {
    if (_gender != null) {
      if (_gender!) {
        //male avatar
        return 'assets/lottie/male.json';
      }
      //female avatar
      return 'assets/lottie/female.json';
    }
    //unisex avatar
    return 'assets/lottie/person.json';
  }

  Widget _loginField() => Row(
        children: [
          Avatar(lottiePath: _lottePath()),
          Expanded(
            child: TextFormField(
              //todo: add init login
              controller: _loginController,
              decoration: borderCross(
                "Your name (optional)",
                const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                3,
              ),
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
}
