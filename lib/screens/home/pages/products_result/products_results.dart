import 'package:fit_fit_meal/bloc/product/product_bloc.dart';
import 'package:fit_fit_meal/utils/insets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsResults extends StatelessWidget {
  const ProductsResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Results"),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Insets.xs),
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductsLoaded) {
                // return const Text("loaded");
                return Column(
                  children: state.products
                      .map(
                        (product) => Padding(
                          padding: const EdgeInsets.all(Insets.xs),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.red,
                              backgroundColor: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(Insets.xs),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(Insets.xs),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          product.name,
                                          style: const TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: Insets.xs),
                                        Text(
                                          product.producer,
                                          style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      _productRow("Energy",
                                          "${product.nutritionalLabelling.energy} kcal"),
                                      _productRow("Fat",
                                          "${product.nutritionalLabelling.fat}"),
                                      _productRow("Saturated",
                                          "${product.nutritionalLabelling.saturated}"),
                                      _productRow("Carbohydrates",
                                          "${product.nutritionalLabelling.carbohydrates}"),
                                      _productRow("Sugar",
                                          "${product.nutritionalLabelling.sugar}"),
                                      _productRow("Salt",
                                          "${product.nutritionalLabelling.salt}"),
                                      _productRow("Protein",
                                          "${product.nutritionalLabelling.protein}"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                );
              }
              if (state is LoadingProducts) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              }
              return const Center(
                child: Text("something is wrong"),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _productRow(String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: Insets.l),
        child: Row(
          children: [
            Expanded(flex: 3, child: Text(label)),
            Expanded(
              child: Text(value),
            ),
          ],
        ),
      );
}
