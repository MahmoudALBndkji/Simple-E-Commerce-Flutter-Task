import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_animtype.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/features/home/model/product_model.dart';
import 'package:simple_ecommerce_flutter_task/features/home/view_model/home_cubit.dart';
import 'package:simple_ecommerce_flutter_task/features/home/widgets/product_card.dart';
import 'package:simple_ecommerce_flutter_task/features/home/widgets/category_filter_chips.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  void initState() {
    context.read<HomeCubit>().getAllProducts(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetAllProductsErrorState) {
          QuickAlert.show(
            barrierDismissible: false,
            context: context,
            type: QuickAlertType.error,
            title: "error".tr(context),
            confirmBtnText: "done".tr(context),
            text: state.error,
            animType: QuickAlertAnimType.slideInDown,
          );
        }
      },
      buildWhen: (previous, current) =>
          current is GetAllProductsSuccessState ||
          current is GetAllProductsErrorState ||
          current is GetAllProductsLoadingState,
      builder: (context, state) {
        final isLoading = state is GetAllProductsLoadingState;
        final products = state is GetAllProductsSuccessState
            ? state.products
            : List.generate(8, (_) => ProductModel());
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CategoryFilterChips(),
              const SizedBox(height: 12),
              Expanded(
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1.2 / 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) => Skeletonizer(
                    enabled: isLoading,
                    child: ProductCard(product: products[index]),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
