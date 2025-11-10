part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class GetAllCartsLoadingState extends CartState {}

final class GetAllCartsSuccessState extends CartState {
  final List<CartModel> carts;
  GetAllCartsSuccessState({required this.carts});
}

final class GetAllCartsErrorState extends CartState {
  final String error;
  GetAllCartsErrorState({required this.error});
}

final class GetSingleCartLoadingState extends CartState {}

final class GetSingleCartSuccessState extends CartState {
  final CartModel cart;
  GetSingleCartSuccessState({required this.cart});
}

final class GetSingleCartErrorState extends CartState {
  final String error;
  GetSingleCartErrorState({required this.error});
}

final class AddNewCartLoadingState extends CartState {}

final class AddNewCartSuccessState extends CartState {}

final class AddNewCartErrorState extends CartState {
  final String error;
  AddNewCartErrorState({required this.error});
}

final class UpdateCartLoadingState extends CartState {}

final class UpdateCartSuccessState extends CartState {}

final class UpdateCartErrorState extends CartState {
  final String error;
  UpdateCartErrorState({required this.error});
}

final class DeleteCartLoadingState extends CartState {}

final class DeleteCartSuccessState extends CartState {}

final class DeleteCartErrorState extends CartState {
  final String error;
  DeleteCartErrorState({required this.error});
}
