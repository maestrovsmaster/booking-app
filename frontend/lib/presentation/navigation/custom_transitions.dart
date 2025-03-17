import 'package:flutter/material.dart';

/// Slide animation
Widget slideTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
    ) {
  const begin = Offset(1.0, 0.0);
  const end = Offset.zero;
  const curve = Curves.easeInOut;

  final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  final offsetAnimation = animation.drive(tween);

  return SlideTransition(
    position: offsetAnimation,
    child: child,
  );
}

/// Fade animation
Widget fadeTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
    ) {
  return FadeTransition(
    opacity: animation,
    child: child,
  );
}
