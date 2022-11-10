// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:fit_fit_meal/data/models/product_model.dart';
import 'package:fit_fit_meal/screens/home/pages/scaner_home/widgets/nutrition_facts_label.dart';
import 'package:fit_fit_meal/screens/home/pages/scaner_home/widgets/product_header.dart';
import 'package:fit_fit_meal/utils/insets.dart';
import 'package:flutter/services.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  const ProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

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
              shadowColor: Colors.transparent,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(Insets.s),
                child: Column(
                  children: <Widget>[
                    ProductHeader(product: product),
                    const SizedBox(height: Insets.s),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(Insets.s),
                        child: Column(
                          children: <Widget>[
                            const Text("xyz"),
                            Row(
                              children: [
                                const Text("grams"),
                                const SizedBox(width: Insets.xs),
                                Expanded(
                                  child: TextFormField(),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
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
