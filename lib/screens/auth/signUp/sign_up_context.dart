import 'package:flutter/material.dart';

import '../../../utils/validator.dart';
import '../../../widgets/inputDecoration/border_none.dart';
import '../../../widgets/inputDecoration/border_top_left.dart';
import '../Widgets/auth_title.dart';

class SignUpContext extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  SignUpContext({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AuthTitle(label: "Sign up"),
          const SizedBox(height: 100),
          Form(
            key: _formKey,
            child: Column(
              children: [
                _emailButton(width),
                const SizedBox(height: 8),
                _passwdTextField(width),
                const SizedBox(height: 8),
                _repeatPasswdTextField(width),
                const SizedBox(height: 8),
                _signUpbutton(width),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _emailButton(double width) => SizedBox(
        width: width / 1.7,
        child: TextFormField(
          decoration: borderTopLeft(
            "Email",
            const Icon(
              Icons.email,
              color: Colors.white,
            ),
          ),
          validator: (value) {
            if (Validator.isEmail(value)) {
              return null;
            }
            return "email is incorrect!";
          },
        ),
      );

  Widget _passwdTextField(double width) => SizedBox(
        width: width / 1.7,
        child: TextFormField(
          obscureText: true,
          decoration: borderNone(
            "Password",
            const Icon(
              Icons.password,
              color: Colors.white,
            ),
          ),
        ),
      );

  Widget _repeatPasswdTextField(double width) => SizedBox(
        width: width / 1.7,
        child: TextFormField(
          obscureText: true,
          decoration: borderNone(
            "Repeat password",
            const Icon(
              Icons.password,
              color: Colors.white,
            ),
          ),
        ),
      );

  Widget _signUpbutton(double width) => SizedBox(
        width: width / 1.7,
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                topLeft: Radius.circular(5),
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(5),
              ),
            ),
          ),
          child: const Text(
            "Sign up",
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
        ),
      );
}
