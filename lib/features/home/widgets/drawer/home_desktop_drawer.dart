import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/app_colors.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/dimensions.dart';
import 'package:simple_ecommerce_flutter_task/core/design/size_config.dart';
import 'package:simple_ecommerce_flutter_task/core/network/local/cache_helper.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/styles.dart';
import 'package:simple_ecommerce_flutter_task/core/utils/assets.dart';
import 'package:simple_ecommerce_flutter_task/features/home/widgets/drawer/drawer_items_list_view.dart';

class HomeDesktopDrawer extends StatefulWidget {
  const HomeDesktopDrawer({super.key});

  @override
  State<HomeDesktopDrawer> createState() => _HomeDesktopDrawerState();
}

class _HomeDesktopDrawerState extends State<HomeDesktopDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      width: widthScreen(context) < SizeConfig.tablet
          ? MediaQuery.sizeOf(context).width * .7
          : MediaQuery.sizeOf(context).width * .3,
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 30.0)),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    AssetsImage.logo,
                    width: getResponsiveFontSize(context, fontSize: 180),
                    height: getResponsiveFontSize(context, fontSize: 180),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10.0),
                  child: Row(
                    spacing: 10.0,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.person, size: 30.0),
                      FutureBuilder<String?>(
                        future: CacheHelper.instance.read(key: "username"),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData ||
                              snapshot.data == null ||
                              snapshot.data!.isEmpty) {
                            return const SizedBox.shrink();
                          }
                          return Text(
                            snapshot.data!,
                            style: Theme.of(context).textTheme.titleMedium,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Divider(
                    color: Colors.grey.withValues(alpha: 0.5), thickness: 1.5),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20.0)),
          const DrawerItemsListView(),
        ],
      ),
    );
  }
}
