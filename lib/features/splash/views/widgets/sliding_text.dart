import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({super.key, required this.slidingAnimation});
  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) => SlideTransition(
          position: slidingAnimation,
          child: const Text(
            "Simple E-Commerce App",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
