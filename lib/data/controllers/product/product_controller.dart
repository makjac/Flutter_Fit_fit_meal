// ignore_for_file: public_member_api_docs, sort_constructors_first
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
      return await _productRepository.getProductsByBarcode(barcode).single;
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<List<Product>> loadProductByName(String name) async {
    try {
      return await _productRepository.getProductsByName(name).single;
    } catch (error) {
      throw Exception(error);
    }
  }
}
