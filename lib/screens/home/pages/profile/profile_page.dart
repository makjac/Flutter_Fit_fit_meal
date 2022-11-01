import 'package:auto_size_text/auto_size_text.dart';
import 'package:fit_fit_meal/screens/home/pages/profile/widgets/avatar.dart';
import 'package:fit_fit_meal/screens/home/pages/profile/widgets/profile_default_title.dart';
import 'package:fit_fit_meal/screens/home/pages/profile/widgets/profile_label.dart';
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
  final bool? _gender = UserSharedPreferences.getUserGender();

  final TextEditingController _loginController =
      TextEditingController(text: UserSharedPreferences.getUserLogin());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Profile"),
            centerTitle: true,
            floating: true,
            leading: MenuWidget(),
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(Insets.s),
              child: Column(
                children: <Widget>[
                  _loginField(),
                  const SizedBox(height: Insets.m),
                  const ProfileLabel(
                    title: ProfileDefaultTitle(title: "Gender"),
                    body: AutoSizeText("male"),
                    icon: Icon(
                      Icons.person,
                      size: 35,
                    ),
                  ),
                  const SizedBox(height: Insets.s),
                  const ProfileLabel(
                    title: ProfileDefaultTitle(title: "Age"),
                    body: AutoSizeText("22"),
                    icon: Icon(
                      Icons.calendar_month,
                      size: 35,
                    ),
                  ),
                  const SizedBox(height: Insets.s),
                  const ProfileLabel(
                    title: ProfileDefaultTitle(title: "Height"),
                    body: AutoSizeText("195"),
                    icon: Icon(
                      Icons.height_rounded,
                      size: 35,
                    ),
                  ),
                  const SizedBox(height: Insets.s),
                  const ProfileLabel(
                    title: ProfileDefaultTitle(title: "Weight"),
                    body: AutoSizeText("83"),
                    icon: Icon(
                      Icons.monitor_weight_rounded,
                      size: 35,
                    ),
                  ),
                  const SizedBox(height: Insets.s),
                  const ProfileLabel(
                    title: ProfileDefaultTitle(title: "Activity"),
                    body: AutoSizeText("Active"),
                    icon: Icon(
                      Icons.sports_basketball,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
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
