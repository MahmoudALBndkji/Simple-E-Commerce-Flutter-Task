import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_animtype.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/core/utils/assets.dart';
import 'package:simple_ecommerce_flutter_task/features/home/model/product_model.dart';
import 'package:simple_ecommerce_flutter_task/features/home/view_model/home_cubit.dart';
import 'package:simple_ecommerce_flutter_task/features/home/widgets/products_details_view/product_description.dart';
import 'package:simple_ecommerce_flutter_task/features/home/widgets/products_details_view/top_rounded_container.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsDetailsBody extends StatelessWidget {
  const ProductsDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetProductDetailsErrorState) {
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
          current is GetProductDetailsSuccessState ||
          current is GetProductDetailsErrorState ||
          current is GetProductDetailsLoadingState,
      builder: (context, state) {
        final isLoading = state is GetProductDetailsLoadingState;
        final product = state is GetProductDetailsSuccessState
            ? state.product
            : ProductModel();
        return Skeletonizer(
          enabled: isLoading,
          child: Column(
            children: [
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FadeInImage.assetNetwork(
                  placeholder: AssetsImage.logo,
                  image: product.image ?? '',
                  placeholderFit: BoxFit.contain,
                  imageErrorBuilder: (context, error, stackTrace) =>
                      Image.asset(
                    AssetsImage.logo,
                    fit: BoxFit.contain,
                    width: 200,
                    height: 200,
                  ),
                  width: 200,
                  height: 200,
                ),
              ),
              TopRoundedContainer(
                color: Colors.white,
                child: ProductDescription(product: product),
              ),
            ],
          ),
        );
      },
    );
  }
}
