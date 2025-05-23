import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:test_mobdev/screen/features/audio/bloc/audio_bloc.dart';
import 'package:test_mobdev/screen/features/audio/bloc/audio_event.dart';
import 'package:test_mobdev/screen/features/audio/bloc/audio_state.dart';
import 'package:test_mobdev/util/routes/router.dart';
import 'package:test_mobdev/util/typhography/app_typhography.dart';
import 'package:test_mobdev/util/widgets/card_audio.dart';
import 'package:test_mobdev/util/widgets/card_best_seller_audio.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AudioBloc>().add(FetchAudio());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0D0D0E),

        title: Text(
          'Audio Book',
          style: AppTyphography.headlineHigh.copyWith(
            fontSize: 16.sp,
            height: 1.5.sp,
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
              padding: EdgeInsets.all(18.4),
              child: SvgPicture.asset(
                'assets/svg/menu.svg',
                width: 24.w,
                height: 24.h,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(26.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 343.w,
              height: 48.h,
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.w),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Color(0xFF787777)),
                  SizedBox(width: 10.w),
                  Text(
                    "Search Keywords",
                    style: AppTyphography.kontenHigh.copyWith(
                      fontSize: 16.sp,
                      height: 2.h,
                      letterSpacing: 0.15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF787777),
                    ),
                  ),
                  SizedBox(width: 80.w),
                  SvgPicture.asset(
                    'assets/svg/filter.svg',
                    width: 24.w,
                    height: 24.h,
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              'Best-Sellers',
              style: AppTyphography.headlineHigh.copyWith(
                fontSize: 20.sp,
                height: 2.h,
                letterSpacing: 0.15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            BlocBuilder<AudioBloc, AudioState>(
              builder: (context, state) {
                if (state is AudioLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is AudioSuccess) {
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        final audio = state.data[0];
                        return CardBestSellerAudio(
                          imageUrl: audio.thumbnailUrl,
                          title: audio.title,
                          artist: audio.artist,
                          onTap:
                              () => context.goNamed(
                                RouteName.audioBookPlayer,
                                extra: audio,
                              ),
                        );
                      },
                    ),
                  );
                } else if (state is AudioFailure) {
                  return Center(child: Text('Tidak ada Data'));
                } else {
                  return Center(child: Text('Gagal'));
                }
              },
            ),
            SizedBox(height: 32.h),

            Text(
              'More Books',
              style: AppTyphography.headlineHigh.copyWith(
                fontSize: 20.sp,
                height: 2.sp,
                letterSpacing: 0.15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.h),
            BlocBuilder<AudioBloc, AudioState>(
              builder: (context, state) {
                if (state is AudioLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is AudioSuccess) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        final audio = state.data[0];
                        return CardAudio(
                          imageUrl: audio.thumbnailUrl,
                          title: audio.title,
                          artist: audio.artist,
                          onTap:
                              () => context.goNamed(
                                RouteName.audioBookPlayer,
                                extra: audio,
                              ),
                        );
                      },
                    ),
                  );
                } else if (state is AudioFailure) {
                  return Center(child: Text('Tidak ada Data'));
                } else {
                  return Center(child: Text('Gagal'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
