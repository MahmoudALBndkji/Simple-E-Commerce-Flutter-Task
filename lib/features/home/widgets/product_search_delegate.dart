import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/core/widgets/not_found_widget.dart';
import 'package:simple_ecommerce_flutter_task/features/home/model/product_model.dart';
import 'package:simple_ecommerce_flutter_task/features/home/view_model/home_cubit.dart';
import 'package:simple_ecommerce_flutter_task/features/home/views/product_deatails_view.dart';
import 'package:simple_ecommerce_flutter_task/features/home/widgets/search_product_card.dart';

class ProductSearchDelegate extends SearchDelegate<ProductModel?> {
  ProductSearchDelegate({
    required this.products,
    required this.homeCubit,
  });

  final List<ProductModel> products;
  final HomeCubit homeCubit;

  @override
  String? get searchFieldLabel =>
      currentLangAr() ? "ابحث بالاسم أو الفئة" : "Search by Title or Category";

  List<ProductModel> _filter(String q) {
    final String needle = q.trim().toLowerCase();
    if (needle.isEmpty) return products;
    return products.where((p) {
      final String title = (p.title ?? '').toLowerCase();
      final String category = (p.category ?? '').toLowerCase();
      return title.contains(needle) || category.contains(needle);
    }).toList();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = _filter(query);
    return _ResultsList(
      items: results,
      onTap: (product) {
        close(context, product);
        if ((product.id ?? 0) != 0) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ProductDeatailsView(
                productId: product.id!,
                homeCubit: homeCubit,
              ),
            ),
          );
        }
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = _filter(query);
    return _ResultsList(
      items: results,
      onTap: (product) {
        close(context, product);
        if ((product.id ?? 0) != 0) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ProductDeatailsView(
                productId: product.id!,
                homeCubit: homeCubit,
              ),
            ),
          );
        }
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }
}

class _ResultsList extends StatelessWidget {
  const _ResultsList({
    required this.items,
    required this.onTap,
  });

  final List<ProductModel> items;
  final void Function(ProductModel product) onTap;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Center(
        child: NotFoundWidget(
          message: "no_results",
          axisColumn: MainAxisAlignment.center,
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: GridView.builder(
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.2 / 2,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (context, index) =>
            SearchProductCard(product: items[index]),
      ),
    );
  }
}
