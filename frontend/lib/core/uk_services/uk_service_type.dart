import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum UKServiceType {
  safety,
  health,
  education,
  housing,
}

class UKServiceUtils {
  static Color getColor(UKServiceType type) {
    switch (type) {
      case UKServiceType.safety:
        return const Color(0xFFD0021B);
      case UKServiceType.health:
        return const Color(0xFF005EB8);
      case UKServiceType.education:
        return const Color(0xFF7030A0);
      case UKServiceType.housing:
        return const Color(0xFF00843D);
    }
  }

  static String getName(UKServiceType type) {
    switch (type) {
      case UKServiceType.safety:
        return "Safety";
      case UKServiceType.health:
        return "Health";
      case UKServiceType.education:
        return "Education";
      case UKServiceType.housing:
        return "Housing";
    }
  }

  static Widget getIcon(UKServiceType type, {double size = 24.0, Color? color}) {
    switch (type) {
      case UKServiceType.safety:
        return Icon(Icons.warning, size: size, color: color);
      case UKServiceType.health:
        return Icon(Icons.local_hospital, size: size, color: color);
      case UKServiceType.education:
        return Icon(Icons.school, size: size, color: color);
      case UKServiceType.housing:
        return SvgPicture.asset(
          'assets/images/ic_housing.svg',
          width: size,
          height: size,
          colorFilter: ColorFilter.mode(color ?? Colors.black, BlendMode.srcIn),
        );
        default:
          return Icon(Icons.chat, size: size, color: color);
    }
  }
}
