import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FitFitMeal());
}

class FitFitMeal extends StatelessWidget {
  const FitFitMeal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("FitFitMeal"),
          centerTitle: true,
        ),
        body: const Center(
          child: Text("Hello"),
        ),
      ),
    );
  }
}
