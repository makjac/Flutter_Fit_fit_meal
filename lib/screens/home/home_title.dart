import 'package:flutter/material.dart';

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
          "Eat healthy, feel great!",
          style: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 18),
        ),
      ],
    );
  }
}
