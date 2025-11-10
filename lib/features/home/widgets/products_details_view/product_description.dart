import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/app_colors.dart';
import 'package:simple_ecommerce_flutter_task/features/home/model/product_model.dart';
import 'package:simple_ecommerce_flutter_task/features/home/view_model/home_cubit.dart';
import 'package:simple_ecommerce_flutter_task/features/home/widgets/products_details_view/custom_product_item_card.dart';
import 'package:simple_ecommerce_flutter_task/features/home/widgets/products_details_view/rating_stars.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        spacing: 10.0,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
            child: RatingStars(rating: product.rating?.rate?.toDouble() ?? 0),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              product.title ?? '',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomProductItemCard(title: "\$${product.price}"),
              CustomProductItemCard(title: product.category ?? '--------'),
            ],
          ),
          const SizedBox(height: 10.0),
          Text(
            product.description ?? '',
            maxLines: 3,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 20.0),
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
                              color: const Color(0xFF252525),
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
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF252525),
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
                              color: const Color(0xFF252525),
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
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
