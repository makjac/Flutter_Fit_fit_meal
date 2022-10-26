import 'package:flutter/material.dart';

class GenderPicker extends StatelessWidget {
  final bool? gender;
  final ValueChanged<bool> onChanged;
  const GenderPicker({
    Key? key,
    this.gender,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _genderButton(
            true,
            "Male",
            const Icon(
              Icons.male,
              size: 40,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _genderButton(
            false,
            "Female",
            const Icon(
              Icons.female,
              size: 40,
            ),
          ),
        ),
      ],
    );
  }

  Widget _genderButton(bool isMale, String label, Icon icon) => SizedBox(
        height: 100,
        child: ElevatedButton(
          onPressed: () => onChanged(isMale),
          style: (gender == isMale) ? _pickedButton() : _unPickedButton(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Text(label),
            ],
          ),
        ),
      );

  ButtonStyle _pickedButton() => ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.red,
      );

  ButtonStyle _unPickedButton() => ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(150, 244, 67, 54),
        foregroundColor: const Color.fromARGB(100, 255, 255, 255),
      );
}
