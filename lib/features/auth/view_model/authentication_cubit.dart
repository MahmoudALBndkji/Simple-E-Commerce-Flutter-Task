import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/constants.dart';
import 'package:simple_ecommerce_flutter_task/core/network/check_is_success.dart';
import 'package:simple_ecommerce_flutter_task/core/services/api_service.dart';
import 'package:simple_ecommerce_flutter_task/core/network/local/cache_helper.dart';
import 'package:simple_ecommerce_flutter_task/core/error/display_error_message.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit({required this.service}) : super(AuthenticationInitial());
  static AuthenticationCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;
  final ApiService service;

  void userLogin({
    required BuildContext context,
    required String username,
    required String password,
  }) async {
    emit(LoginLoadingState());
    await service.requestApi(
      context: context,
      requestType: RequestType.POST,
      endPoint: Endpoints.userLogin,
      parameter: {"username": username, "password": password},
    ).then((value) async {
      if (checkReqIsSuccess(value.statusCode)) {
        final token = jsonDecode(value.body)["token"];
        if (token != null) {
          await CacheHelper.instance.write(key: "token", value: token);
        }
        await CacheHelper.instance.write(key: "isLogin", value: "true");
        emit(LoginSucessState());
      } else {
        emit(
          LoginErrorState(
            errorMessage: displayErrorMessage(value.body, context),
          ),
        );
      }
    }).catchError((error) {
      debugPrint(error);
      emit(LoginErrorState(errorMessage: error.toString()));
    });
  }

  void changeVisiblePassword() {
    isPassword = !isPassword;
    emit(PasswordVisibilityState());
  }
}
