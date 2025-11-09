import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/constants.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/core/utils/assets.dart';

class LogoAnimationLoading extends StatefulWidget {
  final Color colorText;
  final String message;
  final bool isTranslate;

  const LogoAnimationLoading({
    super.key,
    required this.colorText,
    this.isTranslate = true,
    this.message = 'loading',
  });

  @override
  State<StatefulWidget> createState() => _LogoAnimationLoadingState();
}

class _LogoAnimationLoadingState extends State<LogoAnimationLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _animation = Tween<double>(begin: 50, end: -50).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _animation.value),
                  child: Image.asset(
                    AssetsImage.logo,
                    width: widthScreen(context) / 2,
                  ),
                );
              },
            ),
            const SizedBox(height: 60.0),
            DefaultTextStyle(
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: widget.colorText,
              ),
              child: Text(
                widget.isTranslate
                    ? widget.message.tr(context)
                    : widget.message,
                textAlign: widget.isTranslate ? null : TextAlign.center,
                style: TextStyle(color: widget.colorText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
