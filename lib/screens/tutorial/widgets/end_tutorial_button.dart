// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EndTutorialButton extends StatelessWidget {
  final double height;
  const EndTutorialButton({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: TextButton(
        onPressed: () => context.go("/home"),
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          minimumSize: Size.fromHeight(height),
        ),
        child: const Text("Let's get started!"),
      ),
    );
  }
}
