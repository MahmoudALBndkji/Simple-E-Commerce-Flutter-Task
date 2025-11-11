import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/design/adaptive_layout.dart';
import 'package:simple_ecommerce_flutter_task/features/home/views/products_responsive_view.dart';

class ProductsLayout extends StatelessWidget {
  const ProductsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AdaptiveLayout(
          mobileLayout: (context) =>
              const ProductsResponsiveView(crossAxisCount: 2),
          tableLayout: (context) => ProductsResponsiveView(crossAxisCount: 4),
          desktopLayout: (context) => ProductsResponsiveView(crossAxisCount: 6),
        ),
      ),
    );
  }
}
