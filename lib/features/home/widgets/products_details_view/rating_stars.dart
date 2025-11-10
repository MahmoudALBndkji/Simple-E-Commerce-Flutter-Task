import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final double rating;
  final double size;
  final Color filledColor;
  final Color unfilledColor;
  final int starCount;

  const RatingStars({
    super.key,
    required this.rating,
    this.size = 40,
    this.filledColor = Colors.amber,
    this.unfilledColor = Colors.grey,
    this.starCount = 5,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double responsiveSize =
            (constraints.maxWidth / (starCount * 2)).clamp(12.0, size);
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            starCount,
            (index) {
              double starValue = index + 1;
              IconData iconData;
              if (rating >= starValue) {
                iconData = Icons.star;
              } else if (rating > starValue - 1 && rating < starValue) {
                iconData = Icons.star_half;
              } else {
                iconData = Icons.star_border;
              }
              return Icon(
                iconData,
                color:
                    iconData == Icons.star_border ? unfilledColor : filledColor,
                size: responsiveSize,
              );
            },
          ),
        );
      },
    );
  }
}
