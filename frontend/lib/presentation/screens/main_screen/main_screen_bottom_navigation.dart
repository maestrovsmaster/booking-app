import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/core/theme/app_colors.dart';


class MainScreenBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const MainScreenBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
        height: 80,
         child: BottomNavigationBar(
          currentIndex: currentIndex,
          showUnselectedLabels: true,
          onTap: onTap,
          items: [
            _buildNavItem(
              context,
              iconPath: 'assets/ic_category.svg',
              label: 'Services',
              isSelected: currentIndex == 0,
            ),
            _buildNavItem(
              context,
              iconPath: 'assets/ic_booking.svg',
              label: 'Bookings',
              isSelected: currentIndex == 1,
            ),

          ],
        )));
  }

  BottomNavigationBarItem _buildNavItem(
    BuildContext context, {
    String? iconPath,
    IconData? icon,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      backgroundColor: AppColors.tabBackground,

      icon: iconPath != null
          ? SvgPicture.asset(
              iconPath,
              height: 24,
              width: 24,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? Theme.of(context)
                        .bottomNavigationBarTheme
                        .selectedItemColor!
                    : Colors.grey,
                BlendMode.srcIn,
              ),
            )
          : Icon(
              icon,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
            ),
      label: label,
    );
  }
}
