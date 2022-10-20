import 'package:fit_fit_meal/screens/auth/Widgets/auth_title.dart';
import 'package:fit_fit_meal/widgets/inputDecoration/border_none.dart';
import 'package:fit_fit_meal/widgets/inputDecoration/border_top_left.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInContext extends StatelessWidget {
  const SignInContext({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final _formKey = GlobalKey<FormState>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AuthTitle(label: "Sign in"),
        const SizedBox(height: 100),
        Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                width: width / 1.7,
                child: TextFormField(
                  decoration: borderTopLeft(
                      "Email",
                      const Icon(
                        Icons.email,
                        color: Colors.white,
                      )),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: width / 1.7,
                child: TextFormField(
                  obscureText: true,
                  decoration: borderNone(
                      "Password",
                      const Icon(
                        Icons.password,
                        color: Colors.white,
                      )),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
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
              )
            ],
          ),
        ),
      ],
    );
  }
}
