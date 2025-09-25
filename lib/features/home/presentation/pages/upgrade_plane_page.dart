import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mimi_app_ui_only/config/theme/app_colors.dart';
import 'package:mimi_app_ui_only/config/theme/app_style.dart';
import 'package:mimi_app_ui_only/core/constants/app_assets.dart';
import 'package:mimi_app_ui_only/core/extension/responsive_text.dart';

class UpgradePlanePage extends StatelessWidget {
  const UpgradePlanePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  stops: [0, 1],
                  colors: [Color(0xffDDE2FF), Colors.white],
                ),
              ),
            ),
            Positioned(
              right: -250,
              top: 140,
              child: SvgPicture.asset(
                AppAssets.starBackground,
                colorFilter: const ColorFilter.mode(
                  Color(0xffD3D6FF),
                  BlendMode.srcIn,
                ),
                height: 450,
                width: 450,
              ),
            ),
            Positioned(
              left: -220,
              top: -150,
              child: SvgPicture.asset(
                AppAssets.starBackground2,
                colorFilter: const ColorFilter.mode(
                  Color(0xffD3D6FF),
                  BlendMode.srcIn,
                ),
                height: 450,
                width: 450,
              ),
            ),
            const UpgradePlanePageBody(),
          ],
        ),
      ),
    );
  }
}

class UpgradePlanePageBody extends StatefulWidget {
  const UpgradePlanePageBody({super.key});

  @override
  State<UpgradePlanePageBody> createState() => _UpgradePlanePageBodyState();
}

class _UpgradePlanePageBodyState extends State<UpgradePlanePageBody> {
  String selectedPlan = "monthly";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Row(
            children: [
              const Spacer(),
              Text('Upgrade Plan', style: AppTextStyles.bold28),
              const SizedBox(width: 50),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, 4),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: const Icon(Icons.close, color: Colors.black, size: 22),
                ),
              ),
              const SizedBox(width: 30),
            ],
          ),
          const SizedBox(height: 20),
          Image.asset(AppAssets.rocket, height: 220, width: 220),
          Text(
            'Seamless Anime Experience, Ad-Free.',
            textAlign: TextAlign.center,
            style: AppTextStyles.bold28.copyWith(fontSize: 24.responsive),
          ),
          const SizedBox(height: 8),
          Text(
            'Enjoy unlimited anime streaming without interruptions.',
            textAlign: TextAlign.center,
            style: AppTextStyles.semiBold16.copyWith(
              color: AppColors.baseDefault,
              fontSize: 16.responsive,
            ),
          ),
          const SizedBox(height: 30),

          // Plans
          planCard(
            title: "Monthly",
            price: "\$5 USD ",
            date: "/Month",
            subtitle: "Include Family Sharing",
            isSelected: selectedPlan == "monthly",
            onTap: () => setState(() => selectedPlan = "monthly"),
          ),
          const SizedBox(height: 16),
          planCard(
            title: "Annually",
            price: "\$50 USD ",
            date: "/Year",
            subtitle: "Include Family Sharing",
            isSelected: selectedPlan == "annually",
            onTap: () => setState(() => selectedPlan = "annually"),
          ),

          // Continue button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff5F46F9),
                  shape: RoundedSuperellipseBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  // TODO: Handle continue
                },
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget planCard({
    required String title,
    required String price,
    required String date,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff1B1340) : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.grey.shade300,
          ),
        ),
        child: Row(
          children: [
            Image.asset(AppAssets.export, height: 80, width: 80),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.bold16.copyWith(
                      color: isSelected ? Colors.white : Colors.black,
                      fontSize: 18.responsive,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        price,
                        style: AppTextStyles.bold16.copyWith(
                          color: isSelected ? Colors.white : Colors.black87,
                        ),
                      ),
                      Text(
                        date,
                        style: AppTextStyles.bold16.copyWith(
                          color: isSelected
                              ? Color(0xffA49AD8)
                              : Colors.black87,
                        ),
                      ),
                    ],
                  ),

                  Text(
                    subtitle,
                    style: AppTextStyles.bold12.copyWith(
                      color: isSelected ? Color(0xffA49AD8) : Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: isSelected ? const Color(0xff5F46F9) : Colors.black38,
            ),
          ],
        ),
      ),
    );
  }
}
