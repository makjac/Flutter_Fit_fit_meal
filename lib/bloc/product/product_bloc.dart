import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fit_fit_meal/data/controllers/product/product_controller.dart';
import 'package:fit_fit_meal/data/models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductController _productController;
  ProductBloc({
    ProductController? productController,
  })  : _productController = productController ?? ProductController(),
        super(ProductInitial()) {
    on<LoadProductByName>(_loadProductByName);
    on<LoadProductsByBarcode>(_loadProductByBarcode);
    on<AddNewProduct>(_addProduct);
  }

  FutureOr<void> _loadProductByName(
      LoadProductByName event, Emitter<ProductState> emit) async {
    try {
      emit(LoadingProducts());
      final results = await _productController.loadProductByName(event.name);
      emit(ProductsLoaded(products: results));
    } catch (error) {
      emit(ProductsError(error: error.toString()));
    }
  }

  FutureOr<void> _loadProductByBarcode(
      LoadProductsByBarcode event, Emitter<ProductState> emit) async {
    try {
      emit(LoadingProducts());
      final results =
          await _productController.loadProductByBarcode(event.barcode);
      emit(ProductsLoaded(products: results));
    } catch (error) {
      emit(ProductsError(error: error.toString()));
    }
  }

  FutureOr<void> _addProduct(
      AddNewProduct event, Emitter<ProductState> emit) async {
    try {} catch (error) {
      emit(ProductsError(error: error.toString()));
    }
  }
}
