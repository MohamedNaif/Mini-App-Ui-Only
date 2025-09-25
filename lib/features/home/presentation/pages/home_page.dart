import 'package:flutter/material.dart';
import 'package:mimi_app_ui_only/config/theme/app_style.dart';
import 'package:mimi_app_ui_only/features/home/presentation/widgets/bottom_nav_bar.dart'
    as widgets;
import 'package:mimi_app_ui_only/features/home/presentation/widgets/category_chips.dart'
    as widgets;
import 'package:mimi_app_ui_only/features/home/presentation/widgets/anime_grid.dart'
    as widgets;
import 'package:mimi_app_ui_only/features/home/presentation/widgets/character_section.dart'
    as widgets;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HomePageBody());
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  int _selectedIndex = 0;

  final List<String> categories = [
    'All',
    'Popular',
    'Trending',
    'New Releases',
  ];
  int selectedCategoryIndex = 0;

  final List<AnimeItem> animeList = [
    AnimeItem(
      title: 'Detective Conan',
      genre: 'Mystery',
      rating: 5.0,
      imageUrl: 'assets/detective_conan.jpg',
      isNew: true,
    ),
    AnimeItem(
      title: 'Hunter x Hunter',
      genre: 'Adventure',
      rating: 5.0,
      imageUrl: 'assets/hunter_hunter.jpg',
    ),
  ];

  final List<CharacterItem> characters = [
    CharacterItem(
      name: 'Gon Freecss',
      anime: 'Hunter x Hunter',
      imageUrl: 'assets/gon.jpg',
    ),
    CharacterItem(
      name: 'Naruto Uzumaki',
      anime: 'Naruto',
      imageUrl: 'assets/naruto.jpg',
    ),
    CharacterItem(
      name: 'Luffy',
      anime: 'One Piece',
      imageUrl: 'assets/luffy.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5FF),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Where Anime Comes Alive',
                        style: AppTextStyles.bold28,
                      ),
                    ),
                    const SizedBox(height: 24),

                    widgets.CategoryChips(
                      categories: categories,
                      selectedIndex: selectedCategoryIndex,
                      onSelected: (index) => setState(() {
                        selectedCategoryIndex = index;
                      }),
                    ),
                    const SizedBox(height: 24),

                    widgets.AnimeGrid(items: animeList),
                    const SizedBox(height: 32),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Top Characters',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    widgets.CharacterSection(items: characters),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: widgets.BottomNavBar(
        selectedIndex: _selectedIndex,
        onChanged: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}

// Section widgets moved to widgets/ folder

class AnimeCard extends StatelessWidget {
  final AnimeItem anime;

  const AnimeCard({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Placeholder image with gradient
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: anime.title == 'Detective Conan'
                      ? [
                          const Color(0xFF1E40AF),
                          const Color(0xFF3B82F6),
                          const Color(0xFFF59E0B),
                        ]
                      : [
                          const Color(0xFF059669),
                          const Color(0xFF10B981),
                          const Color(0xFF6366F1),
                        ],
                ),
              ),
              child: Center(
                child: Icon(
                  anime.title == 'Detective Conan'
                      ? Icons.search
                      : Icons.sports_martial_arts,
                  color: Colors.white,
                  size: 48,
                ),
              ),
            ),

            // Rating badge
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 12),
                    const SizedBox(width: 4),
                    Text(
                      anime.rating.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom info
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.8),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      anime.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      anime.genre,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // New badge
            if (anime.isNew)
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEF4444),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'NEW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CharacterCard extends StatelessWidget {
  final CharacterItem character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: _getCharacterColors(character.name),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              character.name.substring(0, 1),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          character.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          character.anime,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  List<Color> _getCharacterColors(String name) {
    switch (name) {
      case 'Gon Freecss':
        return [const Color(0xFF059669), const Color(0xFF10B981)];
      case 'Naruto Uzumaki':
        return [const Color(0xFFF59E0B), const Color(0xFFFBBF24)];
      case 'Luffy':
        return [const Color(0xFFEF4444), const Color(0xFFF87171)];
      default:
        return [const Color(0xFF6366F1), const Color(0xFF8B5CF6)];
    }
  }
}

class AnimeItem {
  final String title;
  final String genre;
  final double rating;
  final String imageUrl;
  final bool isNew;

  AnimeItem({
    required this.title,
    required this.genre,
    required this.rating,
    required this.imageUrl,
    this.isNew = false,
  });
}

class CharacterItem {
  final String name;
  final String anime;
  final String imageUrl;

  CharacterItem({
    required this.name,
    required this.anime,
    required this.imageUrl,
  });
}
