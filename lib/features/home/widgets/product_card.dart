import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/app_colors.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/dimensions.dart';
import 'package:simple_ecommerce_flutter_task/core/utils/assets.dart';
import 'package:simple_ecommerce_flutter_task/features/home/model/product_model.dart';
import 'package:simple_ecommerce_flutter_task/features/home/view_model/home_cubit.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {},
          // () => Navigator.push(
          //   context,
          //   SizeTransitionToTop(
          //     ProductDetailsScreen(
          //       currentProduct: product,
          //       homeCubit: context.read<HomeCubit>(),
          //     ),
          //   ),
          // ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF979797).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: FadeInImage.assetNetwork(
                placeholder: AssetsImage.logo,
                image: product.image ?? '',
                placeholderFit: BoxFit.contain,
                imageErrorBuilder: (context, error, stackTrace) =>
                    Image.asset(AssetsImage.logo, fit: BoxFit.contain),
                width: widthScreen(context) / 2,
                height: 130,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "\$${product.price}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
            Text(
              product.title ?? '',
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Center(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              HomeCubit hCubit = HomeCubit.get(context);
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 36,
                decoration: BoxDecoration(
                  color: primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(
                    color: primaryColor.withValues(alpha: 0.7),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(18)),
                        onTap: () => hCubit.removeProductFromCart(product),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: Icon(
                            Icons.remove,
                            size: 16,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                      ),
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return ScaleTransition(
                          scale: animation,
                          child: child,
                        );
                      },
                      child: Text(
                        hCubit.containsProduct(product.id ?? 0)
                            ? "${hCubit.getCurrentProduct(product.id ?? 0).quantity}"
                            : "${product.quantity}",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).iconTheme.color,
                            ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(18)),
                        onTap: () => hCubit.addProductToCart(product),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: Icon(
                            Icons.add,
                            size: 16,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
