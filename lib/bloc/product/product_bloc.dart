import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fit_fit_meal/data/controllers/product/product_controller.dart';
import 'package:fit_fit_meal/data/models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductController _productController;

  ProductBloc({ProductController? productController})
      : _productController = productController ?? ProductController(),
        super(ProductInitial()) {
    on<CreateProduct>(_create);
  }

  FutureOr<void> _create(
      CreateProduct event, Emitter<ProductState> emit) async {
    try {
      emit(CreatingProduct());
      await _productController.addNewProduct(event.product);
      emit(ProductCreated());
    } catch (error) {
      emit(
        ProductError(error: error.toString()),
      );
    }
  }
}
