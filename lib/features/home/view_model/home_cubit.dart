import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/constants.dart';
import 'package:simple_ecommerce_flutter_task/core/design/adaptive_layout.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/core/log/logger.dart';
import 'package:simple_ecommerce_flutter_task/core/network/check_is_success.dart';
import 'package:simple_ecommerce_flutter_task/core/services/api_service.dart';
import 'package:simple_ecommerce_flutter_task/features/cart/views/cart_view.dart';
import 'package:simple_ecommerce_flutter_task/features/home/model/product_model.dart';
import 'package:simple_ecommerce_flutter_task/features/home/views/products_responsive_view.dart';
import 'package:simple_ecommerce_flutter_task/features/settings/views/settings_view.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.service}) : super(HomeInitial());
  final ApiService service;
  static HomeCubit get(context) => BlocProvider.of(context);
  int screenIndex = 0;

  void changeScreenIndex(int index) {
    screenIndex = index;
    emit(ChangeScreenIndexState(index: index));
  }

  List<Widget> screens = [
    AdaptiveLayout(
      mobileLayout: (context) =>
          const ProductsResponsiveView(crossAxisCount: 2),
      tableLayout: (context) => const ProductsResponsiveView(crossAxisCount: 4),
      desktopLayout: (context) =>
          const ProductsResponsiveView(crossAxisCount: 6),
    ),
    const CartView(),
    const SettingsView(),
  ];
  List<String> titles(BuildContext context) => [
        "products".tr(context),
        "cart".tr(context),
        "settings".tr(context),
      ];

  final List<ProductModel> _fetchedProducts = [];
  final List<ProductModel> _filteredProducts = [];
  final List<String> _categories = [];
  String _selectedCategory = returnAllCategoryKey();

  List<ProductModel> get visibleProducts =>
      List.unmodifiable(_filteredProducts);
  List<String> get availableCategories => List.unmodifiable(_categories);
  String get selectedCategory => _selectedCategory;

  final List<ProductModel> products = [];

  void getAllProducts({required BuildContext context}) async {
    _selectedCategory = returnAllCategoryKey();
    emit(GetAllProductsLoadingState());
    await service
        .requestApi(
      context: context,
      requestType: RequestType.GET,
      endPoint: Endpoints.getAllProducts,
    )
        .then((value) async {
      if (checkReqIsSuccess(value.statusCode)) {
        final List<ProductModel> productsList = [];
        final decodedJson = jsonDecode(value.body);
        for (var element in decodedJson) {
          productsList.add(ProductModel.fromJson(element));
        }
        _fetchedProducts
          ..clear()
          ..addAll(productsList);
        _categories
          ..clear()
          ..addAll(
            _fetchedProducts
                .map((p) => p.category ?? "")
                .where((c) => c.isNotEmpty)
                .toSet()
                .toList()
              ..sort(),
          );
        _filteredProducts
          ..clear()
          ..addAll(_fetchedProducts);
        emit(GetAllProductsSuccessState(products: visibleProducts));
      } else {
        emit(GetAllProductsErrorState(error: value.body));
      }
    }).catchError((error) {
      Logger.error(error.toString());
      emit(GetAllProductsErrorState(error: error.toString()));
    });
  }

  void selectCategory(String? category, String allKey) {
    final next = (category == null || category.trim().isEmpty)
        ? allKey
        : category.trim();
    _selectedCategory = next;
    if (_selectedCategory.toLowerCase() == allKey.toLowerCase()) {
      _filteredProducts
        ..clear()
        ..addAll(_fetchedProducts);
    } else {
      _filteredProducts
        ..clear()
        ..addAll(
          _fetchedProducts.where(
            (p) =>
                (p.category ?? "").toLowerCase() ==
                _selectedCategory.toLowerCase(),
          ),
        );
    }
    emit(GetAllProductsSuccessState(products: visibleProducts));
  }

  void getProductDetails(
      {required BuildContext context, required int productId}) async {
    emit(GetProductDetailsLoadingState());
    await service
        .requestApi(
      context: context,
      requestType: RequestType.GET,
      endPoint: "${Endpoints.getProductDetails}/$productId",
    )
        .then((value) async {
      if (checkReqIsSuccess(value.statusCode)) {
        final decodedJson = jsonDecode(value.body);
        emit(GetProductDetailsSuccessState(
            product: ProductModel.fromJson(decodedJson)));
      } else {
        emit(GetAllProductsErrorState(error: value.body));
      }
    }).catchError((error) {
      Logger.error(error.toString());
      emit(GetProductDetailsErrorState(error: error.toString()));
    });
  }

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

String returnAllCategoryKey() => currentLangAr() ? "الكل" : "All";
