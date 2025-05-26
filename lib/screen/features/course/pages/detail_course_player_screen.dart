import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import 'package:test_mobdev/data/response/course_response.dart';
import 'package:test_mobdev/util/typhography/app_typhography.dart';

class DetailCoursePlayerScreen extends StatefulWidget {
  CourseResponse courseResponse;
  DetailCoursePlayerScreen({super.key, required this.courseResponse});

  @override
  State<DetailCoursePlayerScreen> createState() =>
      _DetailCoursePlayerScreenState();
}

class _DetailCoursePlayerScreenState extends State<DetailCoursePlayerScreen> {
  late VideoPlayerController _controller;
  bool _showControls = true;
  Timer? _hideTimer;
  List<String> videoUrls = [
    'https://api.kontenbase.com/upload/file/storage/65a0e330fac3f5febba7f7f8/C 01 Intro S 01 Perkenalan-BRgfEBrv.mp4',
    'https://api.kontenbase.com/upload/file/storage/65a0e330fac3f5febba7f7f8/C 01 Intro S 01 Perkenalan-BRgfEBrv.mp4',
    'https://api.kontenbase.com/upload/file/storage/65a0e330fac3f5febba7f7f8/C 01 Intro S 01 Perkenalan-BRgfEBrv.mp4',
  ];
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
        Uri.parse(
          'https://api.kontenbase.com/upload/file/storage/65a0e330fac3f5febba7f7f8/C 01 Intro S 01 Perkenalan-BRgfEBrv.mp4',
        ),
      )
      ..initialize().then((_) {
        setState(() {});
      });
  }

  Future<void> _loadVideo(int index) async {
    if (_controller.value.isPlaying) {
      await _controller.pause();
    }
    await _controller.dispose();

    setState(() {
      _controller = VideoPlayerController.networkUrl(
          Uri.parse(videoUrls[index]),
        )
        ..initialize().then((_) {
          setState(() {
            _controller.play();
            _startHideTimer();
          });
        });
    });
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
      if (_showControls && _controller.value.isPlaying) {
        _startHideTimer();
      }
    });
  }

  void _startHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _showControls = false;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _hideTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0D0D0E),

        title: Text(
          'Course Detail Player',
          style: AppTyphography.headlineHigh.copyWith(
            fontSize: 16.sp,
            height: 1.5.sp,
            letterSpacing: 0,
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Column(
          children: [
            Center(
              child:
                  _controller.value.isInitialized
                      ? GestureDetector(
                        onTap: _toggleControls,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            ),
                            if (_showControls)
                              AnimatedOpacity(
                                opacity: _showControls ? 1.0 : 0.0,
                                duration: const Duration(milliseconds: 300),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.skip_previous, size: 40),
                                      onPressed:
                                          _currentIndex > 0
                                              ? () {
                                                _currentIndex--;
                                                _loadVideo(_currentIndex);
                                              }
                                              : null,
                                    ),
                                    IconButton(
                                      iconSize: 80,
                                      icon: Icon(
                                        _controller.value.isPlaying
                                            ? Icons.pause_circle_filled
                                            : Icons.play_circle_filled,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (_controller.value.isPlaying) {
                                            _controller.pause();
                                          } else {
                                            _controller.play();
                                            _startHideTimer();
                                          }
                                        });
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.skip_next, size: 40),
                                      onPressed:
                                          _currentIndex < videoUrls.length - 1
                                              ? () {
                                                _currentIndex++;
                                                _loadVideo(_currentIndex);
                                              }
                                              : null,
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      )
                      : Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200,
                            color: Colors.black12,
                            child: Image.network(
                              widget.courseResponse.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.skip_previous, size: 40),
                                onPressed:
                                    _currentIndex > 0
                                        ? () {
                                          _currentIndex--;
                                          _loadVideo(_currentIndex);
                                        }
                                        : null,
                              ),
                              IconButton(
                                iconSize: 80,
                                icon: Icon(
                                  _controller.value.isPlaying
                                      ? Icons.pause_circle_filled
                                      : Icons.play_circle_filled,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (_controller.value.isPlaying) {
                                      _controller.pause();
                                      _showControls = true;
                                    } else {
                                      _controller.play();
                                      _showControls = true;
                                      _startHideTimer();
                                    }
                                  });
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.skip_next, size: 40),
                                onPressed:
                                    _currentIndex < videoUrls.length - 1
                                        ? () {
                                          _currentIndex++;
                                          _loadVideo(_currentIndex);
                                        }
                                        : null,
                              ),
                            ],
                          ),
                        ],
                      ),
            ),

            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lesson 2",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    widget.courseResponse.title,

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Text("Created by ", style: TextStyle(color: Colors.grey)),
                      Text(
                        "Diego Davila",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.flag, color: Colors.white, size: 16),
                      SizedBox(width: 4),
                      Text("in English", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(color: Colors.grey),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(12),
                children: const [
                  LessonTile(
                    title: "Lesson 1",
                    subtitle: "Welcome to 23 Ways of Earning Money with AI",
                    duration: "02:30",
                  ),
                  SizedBox(height: 12),
                  PdfTile(
                    title: "The ChatGPT Prompts Guide",
                    duration: "15:00",
                  ),
                  SizedBox(height: 12),
                  LessonTile(
                    title: "Lesson 2",
                    subtitle: "Get Started with ChatGPT",
                    duration: "02:30",
                    isCurrent: true,
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: const BoxDecoration(color: Colors.black),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "Chapter 1 : Introduction to ...",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LessonTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String duration;
  final bool isCurrent;

  const LessonTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.duration,
    this.isCurrent = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          isCurrent ? Colors.red.shade900.withOpacity(0.4) : Colors.transparent,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            color: Colors.white24,
            child: const Icon(
              Icons.play_circle_fill,
              size: 32,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
          Text(duration, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}

class PdfTile extends StatelessWidget {
  final String title;
  final String duration;

  const PdfTile({super.key, required this.title, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade800,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          const Icon(Icons.picture_as_pdf, size: 40, color: Colors.green),
          const SizedBox(width: 12),
          Expanded(
            child: Text(title, style: const TextStyle(color: Colors.white)),
          ),
          Text(duration, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}
