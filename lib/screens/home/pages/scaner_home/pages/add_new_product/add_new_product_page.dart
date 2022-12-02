import 'package:fit_fit_meal/screens/home/pages/scaner_home/widgets/add_prod_dropdown.dart';
import 'package:fit_fit_meal/utils/insets.dart';
import 'package:fit_fit_meal/widgets/inputDecoration/border_none.dart';
import 'package:fit_fit_meal/widgets/inputDecoration/border_top_left.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/decimal_text_input_formatter.dart';

class AddNewProductPage extends StatelessWidget {
  const AddNewProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    String unit = "grams";
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new Product"),
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
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: borderTopLeft(
                        "Name",
                      ),
                      style: const TextStyle(color: Colors.white),
                      validator: (value) => isNull(value),
                    ),
                    const SizedBox(height: Insets.xs),
                    TextFormField(
                      decoration: borderNone("Barcode"),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: false),
                      style: const TextStyle(color: Colors.white),
                      validator: (value) => isNull(value),
                    ),
                    const SizedBox(height: Insets.xs),
                    TextFormField(
                      decoration: borderNone("Producer"),
                      style: const TextStyle(color: Colors.white),
                      validator: (value) => isNull(value),
                    ),
                    const SizedBox(height: Insets.xs),
                    TextFormField(
                      decoration: borderNone("Energy (kcal)"),
                      style: const TextStyle(color: Colors.white),
                      inputFormatters: [
                        DecimalTextInputFormatter(decimalRange: 2)
                      ],
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: (value) => isNull(value),
                    ),
                    const SizedBox(height: Insets.xs),
                    TextFormField(
                      decoration: borderNone("Fat"),
                      style: const TextStyle(color: Colors.white),
                      inputFormatters: [
                        DecimalTextInputFormatter(decimalRange: 2)
                      ],
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: (value) => isNull(value),
                    ),
                    const SizedBox(height: Insets.xs),
                    TextFormField(
                      decoration: borderNone("Saturated"),
                      style: const TextStyle(color: Colors.white),
                      inputFormatters: [
                        DecimalTextInputFormatter(decimalRange: 2)
                      ],
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: (value) => isNull(value),
                    ),
                    const SizedBox(height: Insets.xs),
                    TextFormField(
                      decoration: borderNone("Carbohydrates"),
                      style: const TextStyle(color: Colors.white),
                      inputFormatters: [
                        DecimalTextInputFormatter(decimalRange: 2)
                      ],
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: (value) => isNull(value),
                    ),
                    const SizedBox(height: Insets.xs),
                    TextFormField(
                      decoration: borderNone("Salts"),
                      style: const TextStyle(color: Colors.white),
                      inputFormatters: [
                        DecimalTextInputFormatter(decimalRange: 2)
                      ],
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: (value) => isNull(value),
                    ),
                    const SizedBox(height: Insets.xs),
                    TextFormField(
                      decoration: borderNone("Protein"),
                      style: const TextStyle(color: Colors.white),
                      inputFormatters: [
                        DecimalTextInputFormatter(decimalRange: 2)
                      ],
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: (value) => isNull(value),
                    ),
                    const SizedBox(height: Insets.xs),
                    TextFormField(
                      decoration: borderNone("Sugars"),
                      style: const TextStyle(color: Colors.white),
                      inputFormatters: [
                        DecimalTextInputFormatter(decimalRange: 2)
                      ],
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: (value) => isNull(value),
                    ),
                    const SizedBox(height: Insets.xs),
                    AddProdDropdown(
                        onChanged: (value) => unit = value ?? "grams"),
                    const SizedBox(height: Insets.l),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          formKey.currentState!.validate();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.red,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(Insets.s),
                          child: Text("Add product"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? isNull(String? value) {
    if (value == null || value.isEmpty) {
      return "value cant't be null!";
    }
    return null;
  }
}
