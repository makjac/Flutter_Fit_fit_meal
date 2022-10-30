import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_fit_meal/data/models/product_model.dart';
import 'package:fit_fit_meal/data/repository/model_repository/product_repository/base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firestore;

  ProductRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getProductsByBarcode(String barcode) {
    try {
      final productRef =
          _firestore.collection('product').where('barcode', isEqualTo: barcode);
      return productRef.snapshots().map((products) => products.docs
          .map((product) => Product.fromSnapshot(product))
          .toList());
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Stream<List<Product>> getProductsByName(String name) {
    final productRef = _firestore
        .collection('product')
        .where('name', isGreaterThanOrEqualTo: name)
        .where('name', isLessThan: '${name}z');
    return productRef.snapshots().map((products) =>
        products.docs.map((product) => Product.fromSnapshot(product)).toList());
  }

  @override
  Future<void> createNewProduct(Product product) async {
    try {
      final productRef = _firestore.collection('product');
      await productRef.add(product.toMap());
    } catch (error) {
      throw Exception(error);
    }
  }
}
