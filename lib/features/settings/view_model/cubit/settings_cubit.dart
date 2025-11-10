import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/constants.dart';
import 'package:simple_ecommerce_flutter_task/core/network/check_is_success.dart';
import 'package:simple_ecommerce_flutter_task/core/services/api_service.dart';
import 'package:simple_ecommerce_flutter_task/features/home/model/product_model.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({required this.service}) : super(SettingsInitial());
  final ApiService service;
  static SettingsCubit get(context) => BlocProvider.of(context);
  void addProductToStore(
      {required BuildContext context, required ProductModel product}) async {
    emit(AddProductToStoreLoadingState());
    final response = await service.requestApi(
      context: context,
      requestType: RequestType.POST,
      endPoint: Endpoints.addProductToStore,
      parameter: product.toJson(),
    );
    if (checkReqIsSuccess(response.statusCode)) {
      emit(AddProductToStoreSuccessState());
    } else {
      emit(AddProductToStoreErrorState(error: response.body));
    }
  }
}
