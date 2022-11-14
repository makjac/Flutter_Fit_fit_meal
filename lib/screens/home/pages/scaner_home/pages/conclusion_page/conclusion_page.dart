import 'package:fit_fit_meal/screens/home/pages/scaner_home/widgets/product_conclusion_details.dart';
import 'package:fit_fit_meal/screens/home/pages/scaner_home/widgets/product_lottie_circle.dart';
import 'package:fit_fit_meal/utils/insets.dart';
import 'package:flutter/material.dart';

import 'package:fit_fit_meal/data/models/product_model.dart';
import 'package:go_router/go_router.dart';

class ConclusionPage extends StatelessWidget {
  final Product product;

  const ConclusionPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conclusion"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Insets.s),
              child: Column(
                children: <Widget>[
                  const ProductLottieCircle(),
                  const SizedBox(height: Insets.xl),
                  ProductConclusionDetails(product: product),
                  const SizedBox(height: Insets.l),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.add),
                      label: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Insets.s, horizontal: Insets.xs),
                        child: Text("Add new product"),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.red,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
