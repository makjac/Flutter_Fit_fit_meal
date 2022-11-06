// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:fit_fit_meal/data/controllers/product/base_product_controller.dart';
import 'package:fit_fit_meal/data/models/product_model.dart';
import 'package:fit_fit_meal/data/repository/model_repository/product_repository/product_repository.dart';

class ProductController extends BaseProductController {
  final ProductRepository _productRepository;

  ProductController({
    ProductRepository? productRepository,
  }) : _productRepository = productRepository ?? ProductRepository();

  @override
  Future<void> addNewProduct(Product product) async {
    try {
      _productRepository.createNewProduct(product);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<List<Product>> loadProductByBarcode(String barcode) async {
    try {
      List<Product> complete = [];
      await for (final value
          in _productRepository.getProductsByBarcode(barcode)) {
        complete = value;
        break;
      }
      return complete;
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<List<Product>> loadProductByName(String name) async {
    try {
      List<Product> complete = [];
      await for (final value in _productRepository.getProductsByName(name)) {
        complete = value;
      }
      return complete;
    } catch (error) {
      throw Exception(error);
    }
  }
}
