import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mimi_app_ui_only/config/theme/app_style.dart';
import 'package:mimi_app_ui_only/features/home/presentation/pages/upgrade_plane_page.dart';

import '../../../../core/constants/app_assets.dart';

class HomeDetailesPage extends StatelessWidget {
  const HomeDetailesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff2c1e51),
      body: SafeArea(child: HomeDetailesPageBody()),
    );
  }
}

class HomeDetailesPageBody extends StatelessWidget {
  const HomeDetailesPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Cover Image + Logo
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        // Main background image with gradient overlay
                        Container(
                          height: 550,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                AppAssets.demonslayerBackground,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.transparent,
                                  Color(0xff2c1e51).withValues(alpha: 0.3),
                                  Color(0xff2c1e51).withValues(alpha: 0.8),
                                  Color(0xff2c1e51),
                                ],
                                stops: [0.0, 0.4, 0.6, 0.8, 1.0],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                    // Logo positioned at the bottom
                    Positioned(
                      bottom: 0,
                      child: Image.asset(
                        AppAssets.demonslayerLogo,
                        height: 120,
                        width: 160,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Tags (Genres)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      _ChipItem(text: "Dark Fantasy"),
                      SizedBox(width: 8),
                      _ChipItem(text: "Action"),
                      SizedBox(width: 8),
                      _ChipItem(text: "Adventure"),
                    ],
                  ),
                ),

                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(color: Color(0xffCBC4C4), thickness: 0.3),
                ),
                const SizedBox(height: 12),

                // Stats Row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      _StatItem(iconPath: AppAssets.eye, text: "2.3M views"),
                      _StatItem(iconPath: AppAssets.clapping, text: "2K clap"),
                      _StatItem(
                        iconPath: AppAssets.stopwatch,
                        text: "4 Seasons",
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(color: Color(0xffCBC4C4), thickness: 0.3),
                ),
                const SizedBox(height: 12),

                // Description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(AppAssets.fire),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Demon Slayer: Kimetsu no Yaiba follows Tanjiro Kamado, "
                          "a young boy who becomes a demon slayer after his family "
                          "is slaughtered and his sister Nezuko is turned into a demon.",
                          style: AppTextStyles.semiBold14.copyWith(
                            fontSize: 14,
                            color: Color(0xffCBC4C4),
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),

        // Buttons (Fixed Bottom)
        Container(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          decoration: BoxDecoration(
            color: Color(0xff2c1e51),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Hero(
                          tag: "preview",
                          child: const UpgradePlanePage(),
                        ),
                      ),
                    );
                  },
                  icon: SvgPicture.asset(
                    AppAssets.stopwatch,
                    height: 28,
                    width: 28,
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: const Text(
                    "Preview",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Colors.white.withValues(alpha: 0.3),
                    ),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Hero(
                          tag: "preview",
                          child: const UpgradePlanePage(),
                        ),
                      ),
                    );
                  },
                  icon: SvgPicture.asset(
                    AppAssets.eye,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: const Text(
                    "Watch Now",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff6366f1),
                    elevation: 8,
                    shadowColor: const Color(0xff6366f1).withValues(alpha: 0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ChipItem extends StatelessWidget {
  final String text;
  const _ChipItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Text(
        text,
        style: AppTextStyles.semiBold14.copyWith(color: Colors.white),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String iconPath;
  final String text;
  const _StatItem({required this.iconPath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          height: 20,
          width: 20,
          colorFilter: ColorFilter.mode(
            Colors.white.withValues(alpha: 0.8),
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: AppTextStyles.semiBold14.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
