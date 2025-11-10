import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_animtype.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/app_colors.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/core/utils/logo_animation_loading.dart';
import 'package:simple_ecommerce_flutter_task/core/widgets/buttons/custom_elevated_button.dart';
import 'package:simple_ecommerce_flutter_task/core/widgets/snack_bar_message.dart';
import 'package:simple_ecommerce_flutter_task/features/home/model/product_model.dart';
import 'package:simple_ecommerce_flutter_task/features/settings/view_model/cubit/settings_cubit.dart';

class AddProductToStoreButton extends StatelessWidget {
  const AddProductToStoreButton(
      {super.key, required this.product, required this.formKey});

  final ProductModel product;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is AddProductToStoreLoadingState) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return const LogoAnimationLoading(colorText: Colors.white);
            },
          );
        } else if (state is AddProductToStoreSuccessState) {
          while (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
          customSnackBar(
            context: context,
            keyLanguage: "operation_success",
          );
        } else if (state is AddProductToStoreErrorState) {
          Navigator.pop(context);
          QuickAlert.show(
            barrierDismissible: false,
            context: context,
            type: QuickAlertType.error,
            title: "error".tr(context),
            confirmBtnText: "done".tr(context),
            text: state.error,
            animType: QuickAlertAnimType.slideInDown,
          );
        }
      },
      buildWhen: (previous, current) =>
          current is AddProductToStoreLoadingState ||
          current is AddProductToStoreSuccessState ||
          current is AddProductToStoreErrorState,
      builder: (context, state) => Center(
        child: CustomElevatedButton(
          buttonColor: primaryColor.withValues(alpha: 0.7),
          text: "add_product_to_store".tr(context),
          function: () {
            if (formKey.currentState!.validate()) {
              context
                  .read<SettingsCubit>()
                  .addProductToStore(context: context, product: product);
            }
          },
        ),
      ),
    );
  }
}
