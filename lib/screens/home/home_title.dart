import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          "FitFitMeal",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50,
            color: Colors.white,
          ),
        ),
        Text(
          "Eat healthy, fell great!",
          style: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 18),
        ),
      ],
    );
  }
}
