// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IntPicker extends StatelessWidget {
  int value;
  final String label;
  final ValueChanged<int> onChanged;
  bool isUnit;
  String unit;
  IntPicker({
    Key? key,
    this.value = 0,
    required this.label,
    required this.onChanged,
    this.isUnit = false,
    this.unit = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              label,
              style: const TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController()..text = '$value',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 199, 54, 44),
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    textAlign: isUnit ? TextAlign.right : TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                isUnit
                    ? const Expanded(
                        child: Text(
                          "kg",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      )
                    : const SizedBox(
                        height: 0.0001,
                        width: 0.0001,
                      ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () => onChanged(++value),
                    child: const CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      child: Icon(Icons.arrow_drop_up_sharp),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (value > 0) {
                        onChanged(--value);
                      }
                    },
                    child: const CircleAvatar(
                      radius: 18,
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
