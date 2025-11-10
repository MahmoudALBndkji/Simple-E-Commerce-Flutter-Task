import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';

class SettingsCardItem extends StatelessWidget {
  const SettingsCardItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: Colors.grey, size: 28.0),
      trailing:
          const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 20.0),
      title: Text(title.tr(context)),
    );
  }
}
