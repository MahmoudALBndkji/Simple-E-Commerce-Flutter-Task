import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/styles.dart';
import 'package:simple_ecommerce_flutter_task/features/home/view_model/home_cubit.dart';
import 'package:simple_ecommerce_flutter_task/features/home/widgets/product_search_delegate.dart';

class HomeDesktopAppbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onThemePressed;
  const HomeDesktopAppbar({super.key, required this.onThemePressed});

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
          actions: hCubit.screenIndex == 0
              ? [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 10.0),
                    child: IconButton(
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
                    ),
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
