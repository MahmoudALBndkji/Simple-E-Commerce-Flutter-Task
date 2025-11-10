import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/dimensions.dart';
import 'package:simple_ecommerce_flutter_task/core/utils/assets.dart';
import 'package:simple_ecommerce_flutter_task/features/home/model/product_model.dart';

class SearchProductCard extends StatelessWidget {
  const SearchProductCard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
      ],
    );
  }
}
