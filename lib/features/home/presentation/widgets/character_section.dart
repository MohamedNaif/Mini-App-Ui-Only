import 'package:flutter/material.dart';
import '../pages/home_page.dart';

class TopCharacterSection extends StatelessWidget {
  final List<CharacterItem> items;

  const TopCharacterSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset((1 - value) * 20, 0),
                  child: child,
                ),
              );
            },
            child: Container(
              width: 120,
              margin: const EdgeInsets.only(right: 16),
              child: CharacterCard(character: items[index]),
            ),
          );
        },
      ),
    );
  }
}

