import 'package:auto_size_text/auto_size_text.dart';
import 'package:fit_fit_meal/features/tutorial/utils/tutorial_elements_shape.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/insets.dart';

class IntPicker extends StatefulWidget {
  final int value;
  final String label;
  final ValueChanged<int> onChanged;
  const IntPicker({
    super.key,
    this.value = 0,
    required this.label,
    required this.onChanged,
  });

  @override
  State<IntPicker> createState() => _IntPickerState();
}

class _IntPickerState extends State<IntPicker> {
  void increse() {
    setState(() {
      widget.onChanged(widget.value + 1);
    });
  }

  void decrease() {
    setState(() {
      if (widget.value > 0) {
        widget.onChanged(widget.value - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: tutorialElementsRadius(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Insets.xs),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AutoSizeText(
              widget.label,
              maxLines: 1,
              style: const TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: Insets.xs),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Insets.xs),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: increse,
                    child: const CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      child: Icon(Icons.arrow_drop_up_sharp),
                    ),
                  ),
                  AutoSizeText(
                    "${widget.value}",
                    maxLines: 1,
                    style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  ),
                  InkWell(
                    onTap: decrease,
                    child: const CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      child: Icon(Icons.arrow_drop_down_sharp),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
