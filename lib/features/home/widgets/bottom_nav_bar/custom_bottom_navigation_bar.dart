import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/features/home/view_model/home_cubit.dart';
import 'package:simple_ecommerce_flutter_task/features/home/widgets/bottom_nav_bar/custom_nav_item.dart';

Widget customBottomNavigationBar() {
  return BlocBuilder<HomeCubit, HomeState>(
    builder: (context, state) {
      final HomeCubit hCubit = HomeCubit.get(context);
      return Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.black,
        ),
        child: BottomNavigationBar(
          currentIndex: hCubit.screenIndex,
          onTap: (index) => hCubit.changeScreenIndex(index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue.withValues(alpha: 0.65),
          elevation: 0,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withValues(alpha: 0.65),
          items: [
            BottomNavigationBarItem(
              icon: CustomNavItem(
                isSelected: hCubit.screenIndex == 0,
                icon: Icons.category_sharp,
              ),
              label: "products".tr(context),
            ),
            BottomNavigationBarItem(
              icon: CustomNavItem(
                isSelected: hCubit.screenIndex == 1,
                icon: Icons.shopping_cart,
              ),
              label: "cart".tr(context),
            ),
            BottomNavigationBarItem(
              icon: CustomNavItem(
                isSelected: hCubit.screenIndex == 2,
                icon: Icons.settings,
              ),
              label: "settings".tr(context),
            ),
          ],
        ),
      );
    },
  );
}
