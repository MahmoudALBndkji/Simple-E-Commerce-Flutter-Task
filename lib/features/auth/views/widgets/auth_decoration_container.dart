import 'package:flutter/material.dart';

BoxDecoration authDecorationContainer() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromARGB(255, 32, 103, 150),
        Color.fromARGB(255, 15, 103, 161),
        Color.fromARGB(255, 13, 68, 105),
      ],
    ),
  );
}
