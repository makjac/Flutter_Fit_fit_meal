// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class LoadingProducts extends ProductState {}

class ProductsLoaded extends ProductState {
  final List<Product> products;

  const ProductsLoaded({
    required this.products,
  });

  @override
  List<Object> get props => [products];
}

class AddingNewProduct extends ProductState {}

class ProductAdded extends ProductState {}

class ProductsError extends ProductState {
  final String error;

  const ProductsError({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}
