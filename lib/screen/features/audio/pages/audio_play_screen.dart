import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:test_mobdev/data/response/audio_response.dart';
import 'package:test_mobdev/screen/features/audio/bloc/audio_player/audio_player_qubit.dart';
import 'package:test_mobdev/screen/features/audio/bloc/audio_player/audio_player_state.dart';
import 'package:test_mobdev/util/routes/router.dart';
import 'package:test_mobdev/util/typhography/app_typhography.dart';
import 'package:test_mobdev/util/validator/validator.dart';

class AudioPlayScreen extends StatefulWidget {
  final List<AudioResponse> audioListResponse;
  final int currentIndex;
  const AudioPlayScreen({
    super.key,
    required this.audioListResponse,
    required this.currentIndex,
  });

  @override
  State<AudioPlayScreen> createState() => _AudioPlayScreenState();
}

class _AudioPlayScreenState extends State<AudioPlayScreen> {
  late int currentIndex;
  late AudioResponse currentAudio;
  void nextAudio() {
    if (currentIndex < widget.audioListResponse.length - 1) {
      setState(() {
        currentIndex++;
        currentAudio = widget.audioListResponse[currentIndex];
      });
      playCurrentAudio();
    }
  }

  void prevAudio() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        currentAudio = widget.audioListResponse[currentIndex];
      });
      playCurrentAudio();
    }
  }

  Future<void> playCurrentAudio() async {
    final cubit = context.read<AudioPlayerQubit>();
    await cubit.stop(); // Menghentikan pemutaran sebelumnya
    await cubit.play(currentAudio.audioUrl ?? '');
  }

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
    currentAudio = widget.audioListResponse[currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AudioPlayerQubit>();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xFF0D0D0E),

        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Audio Book',
              style: AppTyphography.headlineHigh.copyWith(
                fontSize: 16.sp,
                height: 1.5.sp,
                letterSpacing: 0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              width: 160.w,
              child: Center(
                child: Text(
                  currentAudio.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTyphography.headlineHigh.copyWith(
                    fontSize: 16.sp,
                    height: 1.5.sp,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            final cubit = context.read<AudioPlayerQubit>();
            cubit.stop();
            context.goNamed(RouteName.audioBook);
          },
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(18.r),
              child: SvgPicture.asset(
                'assets/svg/menu.svg',
                width: 24.w,
                height: 24.h,
              ),
            ),
          ),
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(
                currentAudio.thumbnailUrl,
                height: 380.h,
                width: 343,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: SizedBox(
              width: 300.w,
              child: Text(
                currentAudio.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTyphography.headlineHigh.copyWith(
                  fontSize: 24.sp,
                  height: 1.5.sp,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                SizedBox(
                  width: 130.w,
                  child: Text(
                    '${currentAudio.artist}   - ',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTyphography.headlineHigh.copyWith(
                      fontSize: 16.sp,
                      height: 1.5.sp,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                Text(
                  '  UI/UX Designer',
                  style: AppTyphography.headlineHigh.copyWith(
                    fontSize: 16.sp,
                    height: 1.5.sp,
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.h,
                    vertical: 5.w,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    'Soft Skill',
                    style: AppTyphography.headlineHigh.copyWith(
                      fontSize: 14.sp,
                      height: 1.5.sp,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Text(
                  'Aug 4 · in English',
                  style: AppTyphography.headlineHigh.copyWith(
                    fontSize: 16.sp,
                    height: 1.5.sp,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Column(
              children: [
                BlocBuilder<AudioPlayerQubit, AudioPlayerState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Slider(
                          value: state.position.inSeconds.toDouble(),
                          min: 0,
                          max: state.duration.inSeconds.toDouble(),
                          onChanged: (value) {},
                          activeColor: Colors.white,
                          inactiveColor: Colors.white30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              durationToTimeString(state.position),
                              style: TextStyle(color: Colors.white54),
                            ),
                            Text(
                              durationToTimeString(state.duration),
                              style: TextStyle(color: Colors.white54),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 36.w,
                              ),
                              IconButton(
                                onPressed: prevAudio,
                                icon: Icon(
                                  Icons.skip_previous,
                                  color: Colors.white,
                                  size: 36.w,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  state.isPlay
                                      ? Icons.pause_circle_filled
                                      : Icons.play_circle_filled,
                                  color: Colors.white,
                                  size: 45.w,
                                ),
                                onPressed: () async {
                                  if (state.isPlay) {
                                    await cubit.pause();
                                  } else {
                                    await cubit.play(
                                      "${currentAudio.audioUrl}",
                                    );
                                  }
                                },
                              ),
                              IconButton(
                                onPressed: nextAudio,
                                icon: Icon(
                                  Icons.skip_next,
                                  color: Colors.white,
                                  size: 36.w,
                                ),
                              ),
                              Icon(
                                Icons.bookmark_border,
                                color: Colors.white,
                                size: 36.w,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
