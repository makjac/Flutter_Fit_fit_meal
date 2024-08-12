import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fit_fit_meal/data/controllers/product/base_product_controller.dart';
import 'package:fit_fit_meal/data/controllers/product/product_controller.dart';
import 'package:fit_fit_meal/data/models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductController productController;

  ProductBloc({ProductController? productController})
      : productController = productController ?? ProductControllerImpl(),
        super(ProductInitial()) {
    on<CreateProduct>(_create);
  }

  FutureOr<void> _create(
      CreateProduct event, Emitter<ProductState> emit) async {
    try {
      emit(CreatingProduct());
      await productController.addNewProduct(event.product);
      emit(ProductCreated());
    } catch (error) {
      emit(
        ProductError(error: error.toString()),
      );
    }
  }
}
