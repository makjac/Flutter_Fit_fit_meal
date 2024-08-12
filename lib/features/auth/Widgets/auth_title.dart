import 'package:flutter/material.dart';

class AuthTitle extends StatelessWidget {
  final String label;
  const AuthTitle({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 40,
      ),
    );
  }
}
