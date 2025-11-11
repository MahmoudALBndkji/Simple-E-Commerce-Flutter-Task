import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/design/adaptive_layout.dart';
import 'package:simple_ecommerce_flutter_task/features/auth/views/login_desktop_view.dart';
import 'package:simple_ecommerce_flutter_task/features/auth/views/login_mobile_view.dart';

class LoginLayout extends StatelessWidget {
  const LoginLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AdaptiveLayout(
          mobileLayout: (context) => const LoginMobileView(),
          tableLayout: (context) => const LoginDesktopView(),
          desktopLayout: (context) => const LoginDesktopView(),
        ),
      ),
    );
  }
}
