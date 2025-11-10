import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_flutter_task/features/home/widgets/home_appbar.dart';
import 'package:simple_ecommerce_flutter_task/features/home/view_model/home_cubit.dart';
import 'package:simple_ecommerce_flutter_task/features/home/widgets/bottom_nav_bar/custom_bottom_navigation_bar.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppbar(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final HomeCubit hCubit = HomeCubit.get(context);
          return SafeArea(child: hCubit.screens[hCubit.screenIndex]);
        },
      ),
      bottomNavigationBar: customBottomNavigationBar(),
    );
  }
}
