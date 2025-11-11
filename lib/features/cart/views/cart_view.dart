import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/design/size_config.dart';
import 'package:simple_ecommerce_flutter_task/features/cart/views/widgets/cart_view_body.dart';

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
    final isTableOrBigger =
        MediaQuery.sizeOf(context).width > SizeConfig.tablet;
    return isTableOrBigger
        ? Row(
            children: [
              Expanded(child: SizedBox.shrink()),
              Expanded(
                flex: 2,
                child: CartViewBody(
                  slidingAnimationProducts: slidingAnimationProducts,
                  slidingAnimationFooterFinal: slidingAnimationFooterFinal,
                ),
              ),
              Expanded(child: SizedBox.shrink()),
            ],
          )
        : CartViewBody(
            slidingAnimationProducts: slidingAnimationProducts,
            slidingAnimationFooterFinal: slidingAnimationFooterFinal,
          );
  }
}
