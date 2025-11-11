import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/app_colors.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/styles.dart';
import 'package:simple_ecommerce_flutter_task/features/home/model/custom/drawer_item_model.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.drawerItemModel,
    required this.isActive,
    required this.function,
    this.iconColor,
    this.trailing,
    this.isLogout = false,
  });
  final DrawerItemModel drawerItemModel;
  final bool isActive;
  final Color? iconColor;
  final VoidCallback function;
  final Widget? trailing;
  final bool isLogout;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: isActive ? primaryColor.withValues(alpha: 0.7) : null,
      child: ListTile(
        onTap: function,
        leading: Icon(
          drawerItemModel.icon,
          color: isLogout
              ? Colors.red[400]
              : isActive
                  ? whiteColor
                  : blackColor.withValues(alpha: 0.3),
        ),
        title: Text(
          drawerItemModel.title,
          style: TextStyles.font16BlackSemiBold(context),
        ),
        trailing: trailing,
      ),
    );
  }
}
