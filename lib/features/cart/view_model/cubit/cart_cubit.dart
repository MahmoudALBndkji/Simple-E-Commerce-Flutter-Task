import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_flutter_task/core/log/logger.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/constants.dart';
import 'package:simple_ecommerce_flutter_task/core/services/api_service.dart';
import 'package:simple_ecommerce_flutter_task/core/network/check_is_success.dart';
import 'package:simple_ecommerce_flutter_task/features/cart/model/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.service}) : super(CartInitial());
  final ApiService service;
  static CartCubit get(context) => BlocProvider.of(context);

  void getAllCarts({required BuildContext context}) async {
    emit(GetAllCartsLoadingState());
    await service
        .requestApi(
      context: context,
      requestType: RequestType.GET,
      endPoint: Endpoints.getAllCarts,
    )
        .then((value) {
      if (checkReqIsSuccess(value.statusCode)) {
        final List<CartModel> cartsList = [];
        final decodedJson = jsonDecode(value.body);
        for (var element in decodedJson) {
          cartsList.add(CartModel.fromJson(element));
        }
        emit(GetAllCartsSuccessState(carts: cartsList));
      } else {
        emit(GetAllCartsErrorState(error: value.body));
      }
    }).catchError((error) {
      Logger.error(error.toString());
      emit(GetAllCartsErrorState(error: error.toString()));
    });
  }

  void getSingleCart(
      {required BuildContext context, required int cartId}) async {
    emit(GetSingleCartLoadingState());
    await service
        .requestApi(
      context: context,
      requestType: RequestType.GET,
      endPoint: "${Endpoints.getSingleCart}/$cartId",
    )
        .then((value) {
      if (checkReqIsSuccess(value.statusCode)) {
        final CartModel cart = CartModel.fromJson(jsonDecode(value.body));
        emit(GetSingleCartSuccessState(cart: cart));
      } else {
        emit(GetSingleCartErrorState(error: value.body));
      }
    }).catchError((error) {
      Logger.error(error.toString());
      emit(GetSingleCartErrorState(error: error.toString()));
    });
  }

  void addNewCart(
      {required BuildContext context, required CartModel cart}) async {
    emit(AddNewCartLoadingState());
    await service
        .requestApi(
      context: context,
      requestType: RequestType.POST,
      endPoint: Endpoints.addNewCart,
      parameter: cart.toJson(),
    )
        .then((value) {
      if (checkReqIsSuccess(value.statusCode)) {
        emit(AddNewCartSuccessState());
      } else {
        emit(AddNewCartErrorState(error: value.body));
      }
    }).catchError((error) {
      Logger.error(error.toString());
      emit(AddNewCartErrorState(error: error.toString()));
    });
  }

  void updateCart(
      {required BuildContext context, required CartModel cart}) async {
    emit(UpdateCartLoadingState());
    await service
        .requestApi(
      context: context,
      requestType: RequestType.PUT,
      endPoint: Endpoints.updateCart,
      parameter: cart.toJson(),
    )
        .then((value) {
      if (checkReqIsSuccess(value.statusCode)) {
        emit(UpdateCartSuccessState());
      } else {
        emit(UpdateCartErrorState(error: value.body));
      }
    }).catchError((error) {
      Logger.error(error.toString());
      emit(UpdateCartErrorState(error: error.toString()));
    });
  }

  void deleteCart({required BuildContext context, required int cartId}) async {
    emit(DeleteCartLoadingState());
    await service
        .requestApi(
      context: context,
      requestType: RequestType.DELETE,
      endPoint: "${Endpoints.deleteCart}/$cartId",
    )
        .then((value) {
      if (checkReqIsSuccess(value.statusCode)) {
        emit(DeleteCartSuccessState());
      } else {
        emit(DeleteCartErrorState(error: value.body));
      }
    }).catchError((error) {
      Logger.error(error.toString());
      emit(DeleteCartErrorState(error: error.toString()));
    });
  }
}
