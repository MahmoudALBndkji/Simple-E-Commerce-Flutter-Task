import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/utils/regexp.dart';
import 'package:simple_ecommerce_flutter_task/features/home/model/product_model.dart';
import 'package:simple_ecommerce_flutter_task/features/home/view_model/home_cubit.dart';

class ProductCounter extends StatelessWidget {
  ProductCounter({
    super.key,
    required this.product,
  });

  final ProductModel product;
  final TextEditingController quantityController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  getQuantity() =>
      quantityController.text = splitPriceByCommaNumber(product.quantity);

  @override
  Widget build(BuildContext context) {
    HomeCubit hCubit = HomeCubit.get(context);
    return Container(
      height: 42.0,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.blue.withValues(alpha: 0.7),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Minus button
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            onPressed: () => hCubit.removeProductFromCart(product),
            icon: Icon(
              product.quantity == 1 ? Icons.delete_outline : Icons.remove,
              color: product.quantity == 1 ? Colors.red : Colors.white,
            ),
          ),
          Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              product.quantity.toString(),
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              onPressed: () => hCubit.addProductToCart(product),
              icon: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
