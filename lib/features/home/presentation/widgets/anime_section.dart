import 'package:flutter/material.dart';
import 'package:mimi_app_ui_only/features/home/presentation/pages/home_detailes_page.dart';
import '../pages/home_page.dart';

class AnimeSection extends StatelessWidget {
  final List<AnimeItem> items;

  const AnimeSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeOutCubic,
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, (1 - value) * 20),
                  child: child,
                ),
              );
            },
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        Hero(tag: "preview", child: const HomeDetailesPage()),
                  ),
                );
              },
              child: AnimeCard(anime: items[index]),
            ),
          );
        },
      ),
    );
  }
}
