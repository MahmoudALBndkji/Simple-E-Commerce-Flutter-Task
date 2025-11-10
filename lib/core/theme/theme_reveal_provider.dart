import 'package:flutter/material.dart';

class ThemeRevealProvider extends InheritedWidget {
  final VoidCallback reveal;

  const ThemeRevealProvider({
    required this.reveal,
    required super.child,
    super.key,
  });

  static ThemeRevealProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ThemeRevealProvider>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
