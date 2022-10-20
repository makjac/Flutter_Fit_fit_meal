import 'package:flutter/material.dart';

import '../../../utils/validator.dart';
import '../../../widgets/inputDecoration/border_top_left.dart';
import '../Widgets/auth_title.dart';

class ForgotContext extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  ForgotContext({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AuthTitle(label: "Sign in"),
        const SizedBox(height: 100),
        Form(
          key: _formKey,
          child: Column(
            children: [
              _emailTextField(width),
              const SizedBox(height: 8),
              _signInButton(width),
            ],
          ),
        ),
      ],
    );
  }

  Widget _emailTextField(double width) => SizedBox(
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

  Widget _signInButton(double width) => SizedBox(
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
            "Sign In",
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
        ),
      );
}
