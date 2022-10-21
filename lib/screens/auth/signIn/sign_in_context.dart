import 'package:fit_fit_meal/bloc/auth/auth_bloc.dart';
import 'package:fit_fit_meal/screens/auth/Widgets/auth_title.dart';
import 'package:fit_fit_meal/utils/validator.dart';
import 'package:fit_fit_meal/widgets/buttonStyle/auth_button_style.dart';
import 'package:fit_fit_meal/widgets/inputDecoration/border_none.dart';
import 'package:fit_fit_meal/widgets/inputDecoration/border_top_left.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInContext extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  SignInContext({super.key});

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
              _passwordTextField(width),
              const SizedBox(height: 8),
              _signInButton(width, context),
              const SizedBox(height: 4),
              _forgotPasswdButton(context),
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

  Widget _passwordTextField(double width) => SizedBox(
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
          style: const TextStyle(color: Colors.white),
          validator: (value) {
            if (Validator.isStringNull(value)) {
              return null;
            }
            return "Field is empty!";
          },
          onSaved: (newPassword) => _password = newPassword ?? "",
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
                  .add(SignIn(email: _email, password: _password));
            }
          },
          style: authButtonStyle(),
          child: const Text(
            "Sign In",
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
        ),
      );

  Widget _forgotPasswdButton(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Forgot password?",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: () => context.go("/forgot_password"),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            child: const Text(
              "Refresh",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      );
}
