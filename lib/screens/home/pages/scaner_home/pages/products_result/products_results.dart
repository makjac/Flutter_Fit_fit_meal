import 'package:auto_size_text/auto_size_text.dart';
import 'package:fit_fit_meal/data/models/product_model.dart';
import 'package:fit_fit_meal/screens/home/pages/scaner_home/widgets/result_button.dart';
import 'package:fit_fit_meal/utils/insets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProductsResults extends StatelessWidget {
  final Stream<List<Product>> stream;
  const ProductsResults({required this.stream, super.key});

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
              return _onHasError(snapshot.error, snapshot.stackTrace);
            } else {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return _onConnectionStateNone();
                case ConnectionState.waiting:
                  return _onConnectionStateWating();
                case ConnectionState.active:
                  if (snapshot.data!.isNotEmpty) {
                    return _productsResults(snapshot.data!);
                  } else {
                    return const Center(
                      child: Text("No matches..."),
                    );
                  }
                case ConnectionState.done:
                  if (snapshot.data!.isNotEmpty) {
                    return _productsResults(snapshot.data!);
                  } else {
                    return const Center(
                      child: Text("No matches..."),
                    );
                  }
              }
            }
          },
        ),
      ),
    );
  }

  Widget _onHasError(Object? error, StackTrace? stackTrace) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, color: Colors.white),
            const SizedBox(height: Insets.s),
            AutoSizeText('Error: $error'),
            const SizedBox(height: Insets.xs),
            AutoSizeText('Stack trace: $stackTrace'),
          ],
        ),
      );

  Widget _onConnectionStateNone() => Center(
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

  Widget _onConnectionStateWating() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset("assets/lottie/loading_fork.json"),
            const SizedBox(height: Insets.xs),
            const AutoSizeText("Loading data..."),
          ],
        ),
      );

  Widget _productsResults(List<Product> products) => ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Insets.s, vertical: Insets.xs),
            child: ResultButton(
              product: products[index],
            ),
          );
        },
      );
}
