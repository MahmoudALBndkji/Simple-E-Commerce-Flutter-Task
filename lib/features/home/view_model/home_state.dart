part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class ChangeScreenIndexState extends HomeState {
  final int index;
  ChangeScreenIndexState({required this.index});
}

final class GetAllProductsLoadingState extends HomeState {}

final class GetAllProductsSuccessState extends HomeState {
  final List<ProductModel> products;
  GetAllProductsSuccessState({required this.products});
}

final class GetAllProductsErrorState extends HomeState {
  final String error;
  GetAllProductsErrorState({required this.error});
}

final class GetProductDetailsLoadingState extends HomeState {}

final class GetProductDetailsSuccessState extends HomeState {
  final ProductModel product;
  GetProductDetailsSuccessState({required this.product});
}

final class GetProductDetailsErrorState extends HomeState {
  final String error;
  GetProductDetailsErrorState({required this.error});
}

class AddProductState extends HomeState {}

class RemoveProductState extends HomeState {}

class RemoveProductDirectleyFromCartState extends HomeState {}

class ClearProductsCartState extends HomeState {}
