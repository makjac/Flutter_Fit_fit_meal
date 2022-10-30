import 'package:flutter/material.dart';

import '../../../../../utils/insets.dart';

class BarcodeScanButton extends StatelessWidget {
  const BarcodeScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.red,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(5),
              ),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Icon(Icons.qr_code_scanner_rounded),
            SizedBox(width: Insets.xs),
            Text("Scan barcode"),
          ],
        ),
      ),
    );
  }
}
