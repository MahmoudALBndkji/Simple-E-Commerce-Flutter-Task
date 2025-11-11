import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/core/manager/language_cubit.dart';
import 'package:simple_ecommerce_flutter_task/core/network/local/cache_helper.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/styles.dart';
import 'package:simple_ecommerce_flutter_task/core/widgets/navigation.dart';
import 'package:simple_ecommerce_flutter_task/features/auth/views/login_layout.dart';
import 'package:simple_ecommerce_flutter_task/features/home/model/custom/drawer_item_model.dart';
import 'package:simple_ecommerce_flutter_task/features/home/view_model/home_cubit.dart';
import 'package:simple_ecommerce_flutter_task/features/home/widgets/drawer/drawer_item.dart';

class DrawerItemsListView extends StatefulWidget {
  const DrawerItemsListView({super.key});

  @override
  State<DrawerItemsListView> createState() => _DrawerItemsListViewState();
}

class _DrawerItemsListViewState extends State<DrawerItemsListView> {
  @override
  Widget build(BuildContext context) {
    final items = [
      DrawerItemModel(
        title: 'products'.tr(context),
        icon: Icons.home_outlined,
      ),
      DrawerItemModel(
        title: 'cart'.tr(context),
        icon: Icons.shopping_cart_outlined,
      ),
      DrawerItemModel(
        title: 'settings'.tr(context),
        icon: Icons.settings_outlined,
      ),
      DrawerItemModel(
        title: 'change_lanuage'.tr(context),
        icon: Icons.translate_outlined,
      ),
      DrawerItemModel(
        title: 'logout'.tr(context),
        icon: Icons.logout_outlined,
      ),
    ];
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit homeBloc = HomeCubit.get(context);
        return SliverList.list(
          children: [
            DrawerItem(
              function: () => changeIndexFromDrawer(homeBloc, 0),
              drawerItemModel: items[0],
              isActive: homeBloc.activeIndex == 0,
            ),
            DrawerItem(
              function: () => changeIndexFromDrawer(homeBloc, 1),
              drawerItemModel: items[1],
              isActive: homeBloc.activeIndex == 1,
            ),
            DrawerItem(
              function: () => changeIndexFromDrawer(homeBloc, 2),
              drawerItemModel: items[2],
              isActive: homeBloc.activeIndex == 2,
            ),
            DrawerItem(
              trailing: Text(
                context.read<LanguageCubit>().selectedLanguage == "en"
                    ? "عربي"
                    : "English",
                style: TextStyles.font16TextGreyRegular(context),
              ),
              function: () => context
                  .read<LanguageCubit>()
                  .changeLanguage(currentLangAr() ? "en" : "ar"),
              drawerItemModel: items[3],
              isActive: homeBloc.activeIndex == 3,
            ),
            DrawerItem(
              isLogout: true,
              function: () async {
                await CacheHelper.instance.deleteAll();
                navigateAndRemoveUntil(context, const LoginLayout());
              },
              drawerItemModel: items[4],
              isActive: homeBloc.activeIndex == 4,
            ),
          ],
        );
      },
    );
  }
}

void changeIndexFromDrawer(HomeCubit homeBloc, int currentIndex) {
  if (homeBloc.activeIndex != currentIndex) {
    homeBloc.changeActiveIndex(currentIndex);
  }
}
