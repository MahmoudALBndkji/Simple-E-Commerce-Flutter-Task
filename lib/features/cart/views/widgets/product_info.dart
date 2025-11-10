import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/dimensions.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/styles.dart';
import 'package:simple_ecommerce_flutter_task/core/utils/assets.dart';
import 'package:simple_ecommerce_flutter_task/features/cart/views/widgets/product_counter.dart';
import 'package:simple_ecommerce_flutter_task/features/cart/views/widgets/row_cart_item_info.dart';
import 'package:simple_ecommerce_flutter_task/features/home/model/product_model.dart';
import 'package:simple_ecommerce_flutter_task/features/home/view_model/home_cubit.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.product,
    required this.index,
    required this.hCubit,
  });
  final ProductModel product;
  final HomeCubit hCubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsetsDirectional.only(end: 15.0),
          decoration: BoxDecoration(
            color: Colors.blue.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: FadeInImage.assetNetwork(
              placeholder: AssetsImage.logo,
              image: product.image ?? '',
              width: 100.0,
              height: 100.0,
              placeholderFit: BoxFit.contain,
              imageErrorBuilder: (context, error, stackTrace) => Image.asset(
                AssetsImage.logo,
                width: 100.0,
                height: 100.0,
                fit: BoxFit.contain,
              ),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints:
                    BoxConstraints(maxWidth: widthScreen(context) * 0.5),
                child: Text(
                  product.title ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 5.0),
              RowCartItemInfo(
                title: "item_price".tr(context),
                value: "${product.price}",
              ),
              const SizedBox(height: 5.0),
              ProductCounter(product: product),
            ],
          ),
        ),
        TextButton(
          onPressed: () => hCubit.removeProductDirectleyFromCart(product),
          child: Row(
            children: [
              Icon(
                Icons.delete_outline_outlined,
                color: Colors.red,
                size: 20.0,
              ),
              Text(
                'delete'.tr(context),
                style: TextStyles.font12BlackRegular(context)
                    .copyWith(color: Colors.red),
              )
            ],
          ),
        ),
      ],
    );
  }
}
