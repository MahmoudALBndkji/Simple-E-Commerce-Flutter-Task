import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/app_colors.dart';
import 'package:simple_ecommerce_flutter_task/features/cart/views/widgets/product_item.dart';
import 'package:simple_ecommerce_flutter_task/features/home/view_model/home_cubit.dart';

class ProductsListItemInCartView extends StatelessWidget {
  const ProductsListItemInCartView({super.key, required this.hCubit});
  final HomeCubit hCubit;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
          child: ProductItem(
            hCubit: hCubit,
            index: index,
            product: hCubit.products[index],
          ),
        );
      },
      // separatorBuilder: (context, index) => const SizedBox(height: 1.0),
      separatorBuilder: (context, index) => Divider(
        color: primaryColor.withValues(alpha: 0.7),
        height: 5.0,
        indent: 70.0,
        endIndent: 70.0,
      ),
      itemCount: hCubit.products.length,
    );
  }
}
