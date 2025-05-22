import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test_mobdev/util/routes/router.dart';
import 'package:test_mobdev/util/typhography/app_typhography.dart';
import 'package:test_mobdev/util/widgets/card_audio.dart';

class AudioScreen extends StatelessWidget {
  const AudioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0D0D0E),

        title: Text(
          'Audio Book',
          style: AppTyphography.headlineHigh.copyWith(
            fontSize: 16,
            height: 1.5,
            letterSpacing: 0,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            context.goNamed(RouteName.bottomNavigation);
          },
        ),
        actions: [
          GestureDetector(
            onTap: () {
              context.goNamed(RouteName.bottomNavigation);
            },
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SvgPicture.asset(
                'assets/svg/menu.svg',
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 343,
              height: 48,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Color(0xFF787777)),
                  SizedBox(width: 10),
                  Text(
                    "Search Keywords",
                    style: AppTyphography.kontenHigh.copyWith(
                      fontSize: 16,
                      height: 2,
                      letterSpacing: 0.15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF787777),
                    ),
                  ),
                  SizedBox(width: 150),
                  SvgPicture.asset(
                    'assets/svg/filter.svg',
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ),
            Text(
              'Best-Sellers',
              style: AppTyphography.headlineHigh.copyWith(
                fontSize: 20,
                height: 2,
                letterSpacing: 0.15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: 120,
              height: 250,

              color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/image/logo.png',
                      width: 120,
                      height: 185,
                    ),
                  ),
                  Text(
                    'Best-Sellers',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTyphography.headlineHigh.copyWith(
                      fontSize: 16,
                      height: 2,
                      letterSpacing: 0.15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Best-Sellers',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTyphography.kontenHigh.copyWith(
                      fontSize: 14,
                      height: 2,
                      letterSpacing: 0.15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),

            Text(
              'More Books',
              style: AppTyphography.headlineHigh.copyWith(
                fontSize: 20,
                height: 2,
                letterSpacing: 0.15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            CardAudio(),
          ],
        ),
      ),
    );
  }
}
