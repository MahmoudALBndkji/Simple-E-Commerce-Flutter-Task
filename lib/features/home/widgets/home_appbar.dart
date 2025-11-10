import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/styles.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/theme_cubit.dart';
import 'package:simple_ecommerce_flutter_task/features/home/view_model/home_cubit.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final HomeCubit hCubit = HomeCubit.get(context);
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
                  icon: Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    // showSearch(
                    //   context: context,
                    //   delegate: ProductSearchDelegate(
                    //     productsGroup,
                    //     HomeCubit.get(context),
                    //   ),
                    // );
                  },
                )
              : null,
          actions: [
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                return IconButton(
                  icon: Icon(
                    state is ThemeLight ? Icons.dark_mode : Icons.light_mode,
                  ),
                  onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
