import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Cover Image + Logo
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          AppAssets.demonslayerBackground,
                          height: 500,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 70),
                      ],
                    ),
                    Positioned(
                      bottom: -10,
                      child: Image.asset(
                        AppAssets.demonslayerLogo,
                        height: 180,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Tags (Genres)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Wrap(
                    spacing: 8,
                    children: const [
                      _ChipItem(text: "Dark Fantasy"),
                      _ChipItem(text: "Action"),
                      _ChipItem(text: "Adventure"),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Stats Row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                const SizedBox(height: 16),

                // Description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Demon Slayer: Kimetsu no Yaiba follows Tanjiro Kamado, "
                    "a young boy who becomes a demon slayer after his family "
                    "is slaughtered and his sister Nezuko is turned into a demon.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade800,
                      height: 1.5,
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),

        // Buttons (Fixed Bottom)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.deepPurple),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    "Preview",
                    style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    "Watch Now",
                    style: TextStyle(fontSize: 16, color: Colors.white),
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
    return Chip(label: Text(text), backgroundColor: const Color(0xffE6E6FA));
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
        SvgPicture.asset(iconPath, height: 20, width: 20),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
