import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test_mobdev/data/response/course_response.dart';
import 'package:test_mobdev/util/routes/router.dart';
import 'package:test_mobdev/util/typhography/app_typhography.dart';

class DetailCourseScreen extends StatelessWidget {
  CourseResponse courseResponse;
  DetailCourseScreen({super.key, required this.courseResponse});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0D0D0E),

          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Course Detail',
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
                  courseResponse.title,
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
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.r),
                  topLeft: Radius.circular(12.r),
                ),
                child: Image.network(
                  courseResponse.imageUrl,
                  height: 200.h,
                  width: 375,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courseResponse.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${courseResponse.chapters.length} Chapters * 10 Lessons • 30m 15s Total Length',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            const TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'Overview'),
                Tab(text: 'Contents'),
                Tab(text: 'More Like This'),
              ],
            ),

            Expanded(
              child: TabBarView(
                children: [
                  Center(
                    child: Text(
                      'This course covers ${courseResponse.title}',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      const Text(
                        'Chapter 1',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ListTile(
                        leading: Icon(
                          Icons.play_circle_fill,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Welcome to 23 Ways of Earning Money with AI',
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          '14 mins',
                          style: TextStyle(color: Colors.grey),
                        ),
                        trailing: Icon(Icons.play_arrow, color: Colors.white),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.picture_as_pdf,
                          color: Colors.white,
                        ),
                        title: Text(
                          'ChatGPT Prompts Guide',
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Icon(Icons.download, color: Colors.white),
                      ),
                    ],
                  ),

                  Center(
                    child: Text(
                      'More courses coming soon!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                context.goNamed(
                  RouteName.courseDetailPlayer,
                  extra: courseResponse,
                );
              },
              child: Container(
                height: 48.h,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFFC51011),

                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Continue Last ',
                        style: AppTyphography.headlineSmall.copyWith(
                          fontSize: 16.sp,
                          color: Colors.white,
                          height: 1.sp,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(Icons.play_arrow, color: Colors.white),
                    ],
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
