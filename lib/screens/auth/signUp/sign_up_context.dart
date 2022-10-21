// ignore_for_file: must_be_immutable

import 'package:fit_fit_meal/bloc/auth/auth_bloc.dart';
import 'package:fit_fit_meal/widgets/buttonStyle/auth_button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/validator.dart';
import '../../../widgets/inputDecoration/border_none.dart';
import '../../../widgets/inputDecoration/border_top_left.dart';
import '../Widgets/auth_title.dart';

class SignUpContext extends StatelessWidget {
  String _email = "";
  String _password = "";
  String _repatPassword = "";
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
                _emailTextField(width),
                const SizedBox(height: 8),
                _passwdTextField(width),
                const SizedBox(height: 8),
                _repeatPasswdTextField(width),
                const SizedBox(height: 8),
                _signUpbutton(width, context),
              ],
            ),
          ),
        ],
      ),
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
          style: const TextStyle(color: Colors.white),
          validator: (value) {
            if (Validator.isEmail(value)) {
              return null;
            }
            return "email is incorrect!";
          },
          onSaved: (newEmail) => _email = newEmail ?? "",
        ),
      );

  Widget _passwdTextField(double width) => SizedBox(
        width: width / 1.7,
        child: TextFormField(
          obscureText: true,
          style: const TextStyle(color: Colors.white),
          decoration: borderNone(
            "Password",
            const Icon(
              Icons.password,
              color: Colors.white,
            ),
          ),
          onChanged: (password) => _password = password,
        ),
      );

  Widget _repeatPasswdTextField(double width) => SizedBox(
        width: width / 1.7,
        child: TextFormField(
          obscureText: true,
          style: const TextStyle(color: Colors.white),
          decoration: borderNone(
            "Repeat password",
            const Icon(
              Icons.password,
              color: Colors.white,
            ),
          ),
          validator: (value) {
            if (_password != _repatPassword) {
              return "passwords didn't match";
            }
            return null;
          },
          onChanged: (password) => _repatPassword = password,
        ),
      );

  Widget _signUpbutton(double width, BuildContext context) => SizedBox(
        width: width / 1.7,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            final isValid = _formKey.currentState?.validate();
            if (isValid == true) {
              _formKey.currentState?.save();
              BlocProvider.of<AuthBloc>(context)
                  .add(SignUp(email: _email, password: _password));
            }
          },
          style: authButtonStyle(),
          child: const Text(
            "Sign up",
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
        ),
      );
}
