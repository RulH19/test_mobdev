// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';

import 'package:test_mobdev/data/response/audio_response.dart';
import 'package:test_mobdev/util/routes/router.dart';
import 'package:test_mobdev/util/typhography/app_typhography.dart';

class AudioPlayScreen extends StatefulWidget {
  AudioResponse audioResponse;
  AudioPlayScreen({super.key, required this.audioResponse});

  @override
  State<AudioPlayScreen> createState() => _AudioPlayScreenState();
}

class _AudioPlayScreenState extends State<AudioPlayScreen> {
  final AudioPlayer _player = AudioPlayer();
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;
  bool _isPlaying = false;
  @override
  void initState() {
    super.initState();
    _init();

    _player.playingStream.listen((isPlaying) {
      setState(() {
        _isPlaying = isPlaying;
      });
    });
  }

  Future<void> _init() async {
    try {
      await _player.setUrl(widget.audioResponse.audioUrl!);
      log('Error loading audio: ${_player.durationStream}');

      _player.durationStream.listen((duration) {
        if (duration != null) {
          setState(() {
            _totalDuration = duration;
          });
        }
      });
      _player.positionStream.listen((position) {
        setState(() {
          _currentPosition = position;
        });
      });
    } catch (e) {
      log('Error loading audio: $e');
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(1, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
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
              child: Text(
                widget.audioResponse.title,
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
          ],
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
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
                widget.audioResponse.thumbnailUrl,
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
                widget.audioResponse.title,
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
                    '${widget.audioResponse.artist}   - ',
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
                Slider(
                  value: _currentPosition.inSeconds.toDouble(),
                  min: 0,
                  max: _totalDuration.inSeconds.toDouble(),
                  onChanged: (value) {
                    _player.seek(Duration(seconds: value.toInt()));
                  },
                  activeColor: Colors.white,
                  inactiveColor: Colors.white30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _formatDuration(_currentPosition),
                      style: TextStyle(color: Colors.white54),
                    ),
                    Text(
                      _formatDuration(_totalDuration),
                      style: TextStyle(color: Colors.white54),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.share, color: Colors.white, size: 36.w),
                Icon(Icons.skip_previous, color: Colors.white, size: 36.w),
                IconButton(
                  icon: Icon(
                    _isPlaying
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_filled,
                    color: Colors.white,
                    size: 45.w,
                  ),
                  onPressed: () async {
                    if (_isPlaying) {
                      await _player.pause();
                    } else {
                      await _player.play();
                    }
                  },
                ),
                Icon(Icons.skip_next, color: Colors.white, size: 36.w),
                Icon(Icons.bookmark_border, color: Colors.white, size: 36.w),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
