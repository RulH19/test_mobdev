import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test_mobdev/util/routes/router.dart';
import 'package:test_mobdev/util/typhography/app_typhography.dart';
import 'package:test_mobdev/util/widgets/card_carosel.dart' show CardCarosel;

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int _currentPage = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  final List<CardCarosel> _cards = [
    CardCarosel(
      assets: 'assets/svg/animasi-1.svg',
      label: 'Image 1',
      headline: 'Upgrade skills, Show off credentials!',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis  accumsan.',
    ),
    CardCarosel(
      assets: 'assets/svg/animasi-2.svg',
      label: 'Image 2',
      headline: 'Gain Insights and read Trending Articles',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis serun',
    ),
    CardCarosel(
      assets: 'assets/svg/animasi-3.svg',
      label: 'Image 3',
      headline: 'Attend Events and Expand your network!',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis amet',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CarouselSlider(
            items: _cards,
            carouselController: _controller,
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.85,
              enlargeCenterPage: true,
              viewportFraction: 1.0,
              autoPlay: _currentPage != _cards.length - 1,
              autoPlayInterval: Duration(seconds: 5),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
          ),
          SizedBox(height: 25),
          AnimatedSmoothIndicator(
            activeIndex: _currentPage,
            count: _cards.length,
            effect: WormEffect(
              dotHeight: 8,
              dotWidth: 8,
              activeDotColor: Color(0xFFC51011),
              dotColor: Color(0xFF787777),
            ),
          ),
          SizedBox(height: 25),
          _currentPage == _cards.length - 1
              ? ElevatedButton(
                onPressed: () {
                  context.goNamed(RouteName.login);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC51011),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
              : Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: GestureDetector(
                    onTap: () {
                      final lastIndex = _cards.length - 1;
                      _controller.animateToPage(lastIndex);
                      setState(() {
                        _currentPage = lastIndex;
                      });
                    },
                    child: Text(
                      'Skip',
                      style: AppTyphography.headlineSmall.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
