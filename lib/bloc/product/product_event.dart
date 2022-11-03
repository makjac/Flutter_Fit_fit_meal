// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProductByName extends ProductEvent {
  final String name;

  const LoadProductByName({
    required this.name,
  });

  @override
  List<Object> get props => [name];
}

class LoadProductsByBarcode extends ProductEvent {
  final String barcode;

  const LoadProductsByBarcode({
    required this.barcode,
  });

  @override
  List<Object> get props => [barcode];
}

class AddNewProduct extends ProductEvent {
  final Product product;

  const AddNewProduct({
    required this.product,
  });

  @override
  List<Object> get props => [product];
}
