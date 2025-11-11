import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/styles.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/theme_cubit.dart';
import 'package:simple_ecommerce_flutter_task/features/home/view_model/home_cubit.dart';
import 'package:simple_ecommerce_flutter_task/features/home/widgets/product_search_delegate.dart';

class HomeMobileAppbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onThemePressed;
  const HomeMobileAppbar({super.key, required this.onThemePressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final hCubit = HomeCubit.get(context);
        return AppBar(
          elevation: 2,
          centerTitle: true,
          title: Text(
            hCubit.titles(context)[hCubit.screenIndex],
            style: TextStyles.font24TextGreyBold(context)
                .copyWith(color: Colors.white),
          ),
          leading: hCubit.screenIndex == 0
              ? IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: ProductSearchDelegate(
                        products: hCubit.visibleProducts,
                        homeCubit: hCubit,
                      ),
                    );
                  },
                )
              : null,
          actions: hCubit.screenIndex != 2
              ? [
                  BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, themeState) {
                      return IconButton(
                        icon: Icon(themeState is ThemeLight
                            ? Icons.dark_mode
                            : Icons.light_mode),
                        onPressed: onThemePressed,
                      );
                    },
                  )
                ]
              : null,
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
