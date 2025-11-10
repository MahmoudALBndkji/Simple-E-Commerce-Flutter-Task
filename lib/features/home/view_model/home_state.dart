part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class ChangeScreenIndexState extends HomeState {
  final int index;
  ChangeScreenIndexState({required this.index});
}

class AddProductState extends HomeState {}

class RemoveProductState extends HomeState {}

class RemoveProductDirectleyFromCartState extends HomeState {}

class ClearProductsCartState extends HomeState {}
