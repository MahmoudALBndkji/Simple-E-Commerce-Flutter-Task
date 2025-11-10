import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/app_colors.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/dimensions.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/core/widgets/not_found_widget.dart';
import 'package:simple_ecommerce_flutter_task/core/widgets/snack_bar_message.dart';
import 'package:simple_ecommerce_flutter_task/features/cart/views/widgets/footer_final_info.dart';
import 'package:simple_ecommerce_flutter_task/features/cart/views/widgets/products_list_item.dart';
import 'package:simple_ecommerce_flutter_task/features/home/view_model/home_cubit.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> with TickerProviderStateMixin {
  late AnimationController animationControllerProducts;
  late Animation<Offset> slidingAnimationProducts;
  late AnimationController animationControllerFooterFinal;
  late Animation<Offset> slidingAnimationFooterFinal;
  late AnimationController animationControllerCheckOut;
  late Animation<Offset> slidingAnimationCheckOut;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
  }

  @override
  void dispose() {
    animationControllerProducts.dispose();
    animationControllerFooterFinal.dispose();
    animationControllerCheckOut.dispose();
    super.dispose();
  }

  void initSlidingAnimation() {
    // Animation Products
    animationControllerProducts =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimationProducts = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(animationControllerProducts);
    animationControllerProducts.forward();

    // Animation Footer Final
    animationControllerFooterFinal =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimationFooterFinal = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(animationControllerFooterFinal);
    animationControllerFooterFinal.forward();

    // Animation CheckOut
    animationControllerCheckOut =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimationCheckOut = Tween<Offset>(
      begin: const Offset(0, 5),
      end: Offset.zero,
    ).animate(animationControllerCheckOut);
    animationControllerCheckOut.forward();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit hCubit = HomeCubit.get(context);
        return hCubit.products.isEmpty
            ? Center(
                child: NotFoundWidget(
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
