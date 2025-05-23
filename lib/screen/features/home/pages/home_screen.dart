import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test_mobdev/util/routes/router.dart';
import 'package:test_mobdev/util/typhography/app_typhography.dart';
import 'package:test_mobdev/util/widgets/menu_icon_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 30.w),
                color: Color(0xFFC51011),
                child: Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: Image.asset(
                    'assets/image/logo.png',
                    width: 145.w,
                    height: 24.h,
                  ),
                ),
              ),

              SizedBox(height: 50.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Row(
                  children: [
                    MenuIconItem(
                      onTap: () {
                        context.goNamed(RouteName.courses);
                      },
                      label: "Courses",
                      iconPath: 'assets/svg/icon-courses.svg',
                    ),
                    const SizedBox(width: 24),
                    MenuIconItem(
                      onTap: () {
                        context.goNamed(RouteName.audioBook);
                      },

                      label: "Audio Book",
                      iconPath: 'assets/svg/icon-lesson.svg',
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 110,
            left: 16,
            child: Container(
              width: 330.w,
              height: 48.h,
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.w),
              decoration: BoxDecoration(
                color: Color(0xFF222326),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Color(0xFF787777)),
                  SizedBox(width: 10.w),
                  Text(
                    "Courses, Insights or Events",
                    style: AppTyphography.kontenHigh.copyWith(
                      fontSize: 16.sp,
                      height: 2.sp,
                      letterSpacing: 0.15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF787777),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
