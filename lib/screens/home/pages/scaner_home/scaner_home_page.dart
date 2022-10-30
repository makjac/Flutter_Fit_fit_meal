import 'package:auto_size_text/auto_size_text.dart';
import 'package:fit_fit_meal/screens/home/pages/scaner_home/widgets/barcode_scan_button.dart';
import 'package:fit_fit_meal/screens/home/pages/scaner_home/widgets/product_search_bar.dart';
import 'package:fit_fit_meal/utils/insets.dart';
import 'package:fit_fit_meal/widgets/menu/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ScanerHomePage extends StatelessWidget {
  const ScanerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        leading: const MenuWidget(),
        backgroundColor: Colors.orange,
        shadowColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Insets.s),
          child: orientation == Orientation.portrait
              ? _portraitView()
              : _landscapeView(),
        ),
      ),
    );
  }

  Widget _portraitView() => Column(
        children: <Widget>[
          Expanded(flex: 3, child: _lottieCircle()),
          Expanded(
            child: Center(
              child: _title(),
            ),
          ),
          const Spacer(),
          Expanded(flex: 3, child: _content()),
        ],
      );

  Widget _landscapeView() => Row(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Expanded(flex: 3, child: _lottieCircle()),
                Expanded(
                  child: _title(),
                ),
                const Spacer(),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              children: [
                const Expanded(child: SizedBox()),
                _content(),
                const Expanded(flex: 2, child: SizedBox()),
              ],
            ),
          ),
        ],
      );

  Widget _lottieCircle() => CircleAvatar(
        backgroundColor: Colors.white,
        radius: 110,
        child: Padding(
          padding: const EdgeInsets.all(Insets.s),
          child: LottieBuilder.asset("assets/lottie/food.json"),
        ),
      );

  Widget _title() => const Center(
        child: AutoSizeText(
          "Add product!",
          maxLines: 1,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
      );

  Widget _content() => Column(
        children: const [
          ProductSearchBar(),
          SizedBox(height: Insets.xs),
          BarcodeScanButton(),
        ],
      );
}
