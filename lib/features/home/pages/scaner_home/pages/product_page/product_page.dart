import 'package:fit_fit_meal/features/home/pages/scaner_home/widgets/nutrition_facts_label.dart';
import 'package:fit_fit_meal/features/home/pages/scaner_home/widgets/product_header.dart';
import 'package:fit_fit_meal/features/home/pages/scaner_home/widgets/product_portion.dart';
import 'package:flutter/material.dart';

import 'package:fit_fit_meal/data/models/product_model.dart';
import 'package:fit_fit_meal/utils/insets.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  const ProductPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(product.name),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              shadowColor: Colors.transparent,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(Insets.s),
                child: Column(
                  children: <Widget>[
                    ProductHeader(product: product),
                    const SizedBox(height: Insets.s),
                    ProductPortion(product: product),
                    const SizedBox(height: Insets.s),
                    NutritonFactsLabel(product: product),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
