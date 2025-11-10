import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/features/home/model/product_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int screenIndex = 0;

  void changeScreenIndex(int index) {
    screenIndex = index;
    emit(ChangeScreenIndexState(index: index));
  }

  List<Widget> screens = [
    const SizedBox(), // const ProductsScreen(),
    const SizedBox(), // const CartPage(),
    const SizedBox(), // const ProfilePage(),
    const SizedBox(), // const SettingsPage(),
  ];
  List<String> titles(BuildContext context) => [
        "products".tr(context),
        "cart".tr(context),
        "settings".tr(context),
      ];

  final List<ProductModel> products = [];

  double getTotalPrice() {
    double totalPrice = 0;
    for (ProductModel product in products) {
      totalPrice += product.price! * product.quantity;
    }
    return totalPrice;
  }

  bool containsProduct(int itemId) =>
      products.any((product) => product.id == itemId);

  ProductModel getCurrentProduct(int itemId) =>
      products.firstWhere((product) => product.id == itemId);

  void addProductToCart(ProductModel product) {
    final existingIndex = products.indexWhere((p) => p.id == product.id);
    if (existingIndex != -1) {
      products[existingIndex].quantity++;
    } else {
      product.quantity = 1;
      products.add(product);
    }
    emit(AddProductState());
  }

  void removeProductFromCart(ProductModel product) {
    final existingIndex = products.indexWhere((p) => p.id == product.id);
    if (existingIndex != -1) {
      if (products[existingIndex].quantity > 1) {
        products[existingIndex].quantity--;
      } else {
        product.quantity = 0;
        products.removeAt(existingIndex);
      }
      emit(RemoveProductState());
    }
  }

  void removeProductDirectleyFromCart(ProductModel product) {
    product.quantity = 0;
    products.remove(product);
    emit(RemoveProductDirectleyFromCartState());
  }

  void clearProductsCart() {
    products.clear();
    for (var product in products) {
      product.quantity = 0;
    }
    emit(ClearProductsCartState());
  }
}
