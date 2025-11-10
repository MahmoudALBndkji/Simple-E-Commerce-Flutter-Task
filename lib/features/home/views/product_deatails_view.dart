import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:simple_ecommerce_flutter_task/features/home/view_model/home_cubit.dart';
import 'package:simple_ecommerce_flutter_task/features/home/widgets/products_details_view/products_details_appbar.dart';
import 'package:simple_ecommerce_flutter_task/features/home/widgets/products_details_view/products_details_body.dart';

class ProductDeatailsView extends StatefulWidget {
  const ProductDeatailsView({
    super.key,
    required this.productId,
    required this.homeCubit,
  });
  final int productId;
  final HomeCubit homeCubit;

  @override
  State<ProductDeatailsView> createState() => _ProductDeatailsViewState();
}

class _ProductDeatailsViewState extends State<ProductDeatailsView> {
  @override
  void initState() {
    widget.homeCubit
        .getProductDetails(context: context, productId: widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.homeCubit,
      child: Scaffold(
        appBar: const ProductsDetailsAppbar(),
        body: ProductsDetailsBody(),
      ),
    );
  }
}
