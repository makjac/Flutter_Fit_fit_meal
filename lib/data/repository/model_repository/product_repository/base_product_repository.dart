import 'package:fit_fit_meal/data/models/product_model.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getProductsByBarcode(String barcode);

  Stream<List<Product>> getProductsByName(String barcode);

  Future<void> createNewProduct(Product product);
}
