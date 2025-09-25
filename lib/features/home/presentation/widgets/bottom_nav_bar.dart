import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mimi_app_ui_only/config/theme/app_colors.dart';
import 'package:mimi_app_ui_only/core/constants/app_assets.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withValues(alpha: .1)),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 6,
            activeColor: Colors.white,
            iconSize: 20,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: AppColors.brandPrimary,
            color: Colors.grey[600],
            tabs: [
              _navItem(
                AppAssets.homeNavBar,
                'Home',
                Icons.home,
                isActive: selectedIndex == 0,
              ),
              _navItem(
                AppAssets.groupNavBar,
                'Bookmark',
                Icons.bookmark_outline,
                isActive: selectedIndex == 1,
              ),
              _navItem(
                AppAssets.searchNavBar,
                'Search',
                Icons.search,
                isActive: selectedIndex == 2,
              ),
              _navItem(
                AppAssets.group1NavBar,
                'Browse',
                Icons.language,
                isActive: selectedIndex == 3,
              ),
              _navItem(
                AppAssets.settingNavBar,
                'Profile',
                Icons.person,
                isActive: selectedIndex == 4,
              ),
            ],
            selectedIndex: selectedIndex,
            onTabChange: onChanged,
          ),
        ),
      ),
    );
  }

  GButton _navItem(
    String asset,
    String text,
    IconData fallback, {
    bool isActive = false,
  }) {
    return GButton(
      leading: AnimatedScale(
        scale: isActive ? 1.12 : 1.0,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        child: SvgPicture.asset(
          asset,
          colorFilter: ColorFilter.mode(
            isActive ? Colors.white : AppColors.brandGrey,
            BlendMode.srcIn,
          ),
          width: 20,
          height: 20,
        ),
      ),
      icon: fallback,
      text: text,
      textColor: isActive ? Colors.white : AppColors.brandPrimary,
    );
  }
}
