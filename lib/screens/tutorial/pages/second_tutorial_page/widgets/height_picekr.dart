import 'package:flutter/material.dart';

class HeightPicker extends StatelessWidget {
  final int height;
  final ValueChanged<double> onChanged;
  const HeightPicker({
    Key? key,
    required this.height,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          children: <Widget>[
            Text(
              "Height $height cm",
              style: const TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(height: 8),
            Slider.adaptive(
              thumbColor: Colors.red,
              activeColor: Colors.red,
              inactiveColor: const Color.fromARGB(74, 244, 67, 54),
              label: "$height",
              value: height.toDouble(),
              onChanged: (value) => onChanged(value),
              min: 0,
              max: 300,
            ),
          ],
        ),
      ),
    );
  }
}
