import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/app_colors.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/dimensions.dart';
import 'package:simple_ecommerce_flutter_task/core/widgets/empty_cart_widget.dart';
import 'package:simple_ecommerce_flutter_task/core/widgets/snack_bar_message.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/features/home/view_model/home_cubit.dart';
import 'package:simple_ecommerce_flutter_task/features/cart/views/widgets/footer_final_info.dart';
import 'package:simple_ecommerce_flutter_task/features/cart/views/widgets/products_list_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({
    super.key,
    required this.slidingAnimationProducts,
    required this.slidingAnimationFooterFinal,
  });

  final Animation<Offset> slidingAnimationProducts;
  final Animation<Offset> slidingAnimationFooterFinal;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit hCubit = HomeCubit.get(context);
        return hCubit.products.isEmpty
            ? Center(
                child: EmptyCartWidget(
                  message: "add_to_cart",
                  axisColumn: MainAxisAlignment.center,
                ),
              )
            : Column(
                children: [
                  const SizedBox(height: 10.0),
                  Expanded(
                    child: AnimatedBuilder(
                      animation: slidingAnimationProducts,
                      builder: (context, child) => SlideTransition(
                        position: slidingAnimationProducts,
                        child: ProductsListItemInCartView(hCubit: hCubit),
                      ),
                    ),
                  ),
                  AnimatedBuilder(
                    animation: slidingAnimationFooterFinal,
                    builder: (context, child) => SlideTransition(
                      position: slidingAnimationFooterFinal,
                      child: FooterFinalInfo(hCubit: hCubit),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: widthScreen(context) / 2,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        hCubit.clearProductsCart();
                        customSnackBar(
                          context: context,
                          keyLanguage: 'checkout_successfully',
                        );
                      },
                      icon: Icon(Icons.account_balance_wallet_outlined,
                          color: whiteColor),
                      label: Text("checkout".tr(context)),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        backgroundColor: Colors.blue.withValues(alpha: 0.65),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              );
      },
    );
  }
}
