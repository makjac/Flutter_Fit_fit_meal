import 'package:flutter/material.dart';

class ForgotPasswdPage extends StatelessWidget {
  const ForgotPasswdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Forgot password page"),
          centerTitle: true,
        ),
      ),
    );
  }
}
