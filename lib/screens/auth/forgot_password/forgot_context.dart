import 'package:fit_fit_meal/bloc/auth/auth_bloc.dart';
import 'package:fit_fit_meal/widgets/buttonStyle/auth_button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/validator.dart';
import '../../../widgets/inputDecoration/border_top_left.dart';
import '../Widgets/auth_title.dart';

class ForgotContext extends StatelessWidget {
  String _email = "";
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
              _signInButton(width, context),
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

  Widget _signInButton(double width, BuildContext context) => SizedBox(
        width: width / 1.7,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            final isValid = _formKey.currentState?.validate();
            if (isValid == true) {
              _formKey.currentState?.save();
              BlocProvider.of<AuthBloc>(context)
                  .add(RefreshPassword(email: _email));
            }
          },
          style: authButtonStyle(),
          child: const Text(
            "Sign In",
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
        ),
      );
}
