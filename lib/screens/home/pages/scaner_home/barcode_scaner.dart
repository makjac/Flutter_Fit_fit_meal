import 'package:fast_barcode_scanner/fast_barcode_scanner.dart';
import 'package:fit_fit_meal/bloc/product/product_bloc.dart';
import 'package:fit_fit_meal/utils/insets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class BarcodeScaner extends StatelessWidget {
  const BarcodeScaner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BarcodeCamera(
        types: const [
          BarcodeType.aztec,
          BarcodeType.ean8,
          BarcodeType.ean13,
          BarcodeType.code128,
          BarcodeType.code39,
          BarcodeType.upcA,
          BarcodeType.upcE,
          BarcodeType.codabar,
        ],
        framerate: Framerate.fps240,
        resolution: Resolution.hd4k,
        onScan: (barcode) {
          BlocProvider.of<ProductBloc>(context)
              .add(LoadProductsByBarcode(barcode: barcode.value));
          context.go("/home/results");
        },
        children: <Widget>[
          LottieBuilder.asset("assets/lottie/scanning.json"),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(Insets.s),
              child: ElevatedButton(
                onPressed: () => context.pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(10),
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(Insets.xs),
                  child: Text("Stop scanning"),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
