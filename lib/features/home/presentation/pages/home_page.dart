import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mimi_app_ui_only/config/theme/app_colors.dart';
import 'package:mimi_app_ui_only/config/theme/app_style.dart';
import 'package:mimi_app_ui_only/core/constants/app_assets.dart';
import 'package:mimi_app_ui_only/core/extension/responsive_text.dart';
import 'package:mimi_app_ui_only/features/home/presentation/widgets/bottom_nav_bar.dart'
    as widgets;
import 'package:mimi_app_ui_only/features/home/presentation/widgets/category_chips.dart'
    as widgets;
import 'package:mimi_app_ui_only/features/home/presentation/widgets/anime_section.dart'
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
    'Top Rated',
    'Upcoming',
  ];
  int selectedCategoryIndex = 0;

  final List<AnimeItem> animeList = [
    AnimeItem(
      title: 'Detective Conan',
      genre: 'Mystery',
      rating: 5.0,
      imageUrl: AppAssets.conanPng,
    ),
    AnimeItem(
      title: 'Hunter x Hunter',
      genre: 'Adventure',
      rating: 5.0,
      imageUrl: AppAssets.hunterXHunterPosterPng,
    ),
    AnimeItem(
      title: 'Dragon Ball',
      genre: 'Adventure',
      rating: 5.0,
      imageUrl: AppAssets.dragonballPng,
    ),
  ];

  final List<CharacterItem> characters = [
    CharacterItem(
      name: 'Gon Freecss',
      anime: 'Hunter x Hunter',
      imageUrl: AppAssets.gonCharacter,
    ),
    CharacterItem(
      name: 'Naruto',
      anime: 'Naruto Shippuden',
      imageUrl: AppAssets.narutoCharacter,
    ),
    CharacterItem(
      name: 'Conan',
      anime: 'Detective Conan',
      imageUrl: AppAssets.conanCharacter,
    ),
    CharacterItem(
      name: 'Luffy',
      anime: 'One Piece',
      imageUrl: AppAssets.luffyCharacter,
    ),

    CharacterItem(
      name: 'Goku',
      anime: 'Dragon Ball Z',
      imageUrl: AppAssets.dragonballCharacter,
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

                    widgets.AnimeSection(items: animeList),
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
                    widgets.TopCharacterSection(items: characters),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Flexible(
            child: SizedBox(
              width: 200,
              height: 350,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    // Image
                    Image.asset(
                      anime.imageUrl,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),

                    // Rating badge
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              AppAssets.starIcon,
                              width: 16,
                              height: 16,
                            ),

                            const SizedBox(width: 4),
                            Text(
                              anime.rating.toString(),
                              style: AppTextStyles.bold14,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),
          Text(
            anime.title,
            style: AppTextStyles.semiBold16.copyWith(fontSize: 18.responsive),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            anime.genre,
            style: AppTextStyles.semiBold14.copyWith(
              color: AppColors.baseDefault,
              fontSize: 16.responsive,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class CharacterCard extends StatelessWidget {
  final CharacterItem character;
  final double? width;
  final double? height;
  final double? radius;

  const CharacterCard({
    super.key,
    required this.character,
    this.width,
    this.height,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: SizedBox(
            height: height ?? 100,
            width: width ?? 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius ?? 90),
              child: Image.asset(character.imageUrl, fit: BoxFit.cover),
            ),
          ),
        ),

        const SizedBox(height: 12),
        Text(
          character.name,
          style: AppTextStyles.semiBold16.copyWith(fontSize: 18.responsive),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          character.anime,
          style: AppTextStyles.semiBold14.copyWith(
            color: AppColors.baseDefault,
            fontSize: 16.responsive,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class AnimeItem {
  final String title;
  final String genre;
  final double rating;
  final String imageUrl;

  AnimeItem({
    required this.title,
    required this.genre,
    required this.rating,
    required this.imageUrl,
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
