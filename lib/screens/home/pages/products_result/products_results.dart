import 'package:auto_size_text/auto_size_text.dart';
import 'package:fit_fit_meal/data/models/product_model.dart';
import 'package:fit_fit_meal/data/repository/model_repository/product_repository/product_repository.dart';
import 'package:fit_fit_meal/utils/calorie_calculator.dart';
import 'package:fit_fit_meal/utils/insets.dart';
import 'package:flutter/material.dart';

class ProductsResults extends StatelessWidget {
  final ProductRepository _productRepository;
  final Stream<List<Product>> stream;
  ProductsResults(
      {ProductRepository? productRepository, required this.stream, super.key})
      : _productRepository = productRepository ?? ProductRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Results"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: StreamBuilder<List<Product>>(
          stream: stream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error, color: Colors.white),
                    const SizedBox(height: Insets.s),
                    AutoSizeText('Error: ${snapshot.error}'),
                    const SizedBox(height: Insets.xs),
                    AutoSizeText('Stack trace: ${snapshot.stackTrace}'),
                  ],
                ),
              );
            } else {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.info,
                          color: Colors.blue,
                          size: 60,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text('Select a lot'),
                        ),
                      ],
                    ),
                  );
                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(
                          color: Colors.red,
                        ),
                        SizedBox(height: Insets.xs),
                        AutoSizeText("Loading data..."),
                      ],
                    ),
                  );
                case ConnectionState.active:
                  if (snapshot.data!.isNotEmpty) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Insets.s, vertical: Insets.xs),
                          child: _resultButtom(snapshot.data![index]),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text("No matches..."),
                    );
                  }
                case ConnectionState.done:
                  if (snapshot.data!.isNotEmpty) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Insets.s, vertical: Insets.xs),
                          child: _resultButtom(snapshot.data![index]),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text("No matches..."),
                    );
                  }
              }
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.catching_pokemon),
                  SizedBox(height: Insets.xs),
                  Text("I'm pikachu :3"),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _resultButtom(Product product) => ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.red,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(30),
              topLeft: Radius.circular(30),
              topRight: Radius.circular(10),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Insets.s),
          child: Column(
            children: [
              AutoSizeText(
                "${product.name}, ${product.producer}",
                maxLines: 1,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: Insets.s),
              Container(
                constraints: const BoxConstraints(maxWidth: 300),
                decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.3),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(Insets.s),
                  child: _foodFrontPackLabel(
                    product,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _foodFrontPackLabel(Product product) => Row(
        children: <Widget>[
          Expanded(
            child: _foodLabelElement(
                "Energy",
                "${product.nutritionalLabelling.energy}",
                Colors.white,
                const AutoSizeText(
                  "kcal",
                  maxLines: 1,
                  style: TextStyle(color: Colors.black),
                )),
          ),
          Expanded(
            child: _foodLabelElement(
              "Fat",
              "${product.nutritionalLabelling.fat}g",
              CalorieCalculator.fatValueColor(
                product.nutritionalLabelling.fat,
              ),
            ),
          ),
          Expanded(
            child: _foodLabelElement(
              "Saturated",
              "${product.nutritionalLabelling.saturated}g",
              CalorieCalculator.saltsValueColor(
                product.nutritionalLabelling.saturated,
              ),
            ),
          ),
          Expanded(
            child: _foodLabelElement(
              "Sugars",
              "${product.nutritionalLabelling.sugar}g",
              CalorieCalculator.sugarsValueColor(
                product.nutritionalLabelling.sugar,
              ),
            ),
          ),
          Expanded(
            child: _foodLabelElement(
              "Salts",
              "${product.nutritionalLabelling.salt}g",
              CalorieCalculator.saltsValueColor(
                product.nutritionalLabelling.salt,
              ),
            ),
          ),
        ],
      );

  Widget _foodLabelElement(String title, String value, Color color,
          [Widget? bottom]) =>
      Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.elliptical(500, 150),
          ),
          border: Border.all(color: Colors.black),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                title,
                maxLines: 1,
                style: const TextStyle(color: Colors.black),
              ),
              AutoSizeText(
                value,
                maxLines: 1,
                style: const TextStyle(color: Colors.black),
              ),
              bottom ?? const SizedBox(),
            ],
          ),
        ),
      );
}
