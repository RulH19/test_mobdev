import 'package:flutter/material.dart';

import 'package:test_mobdev/util/typhography/app_typhography.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardCourse extends StatelessWidget {
  final String author;
  final String title;
  final String imageUrl;
  Function()? onTap;
  CardCourse({
    super.key,
    required this.author,
    required this.title,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 90.h,
            width: 330.w,
            margin: EdgeInsets.symmetric(vertical: 20.w),
            padding: EdgeInsets.all(4.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6.r),
                      child: Image.network(
                        imageUrl,
                        width: 70.w,
                        height: 70.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 1,
                      left: 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          "New",
                          style: AppTyphography.headlineSmall.copyWith(
                            fontSize: 12.sp,
                            height: 1.5,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 220.w,
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTyphography.headlineSmall.copyWith(
                          fontSize: 12.sp,
                          height: 1.5,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),

                    Row(
                      children: [
                        CircleAvatar(
                          radius: 10.r,
                          backgroundImage: AssetImage('assets/image/logo.png'),
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          author,
                          style: AppTyphography.kontenSmall.copyWith(
                            fontSize: 12.sp,
                            height: 1.5,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 55.w),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.h,
                            vertical: 4.w,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.tealAccent),
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Text(
                            "Beginner",
                            style: TextStyle(
                              color: Colors.tealAccent,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Icon(Icons.flag, size: 14.w, color: Colors.white),
                      ],
                    ),
                    const SizedBox(height: 6),

                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.h,
                            vertical: 4.w,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.design_services,
                                color: Colors.white,
                                size: 12.w,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "Design",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 70.w),

                        Row(
                          children: [
                            Icon(
                              Icons.menu_book,
                              color: Colors.white,
                              size: 14.sp,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              "16",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                              ),
                            ),

                            SizedBox(width: 12.w),
                            Icon(
                              Icons.schedule,
                              color: Colors.white,
                              size: 14.sp,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              "1:20:10",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 343.w,
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.transparent,
                  Colors.white.withAlpha(80),
                  Colors.white.withAlpha(150),
                  Colors.white.withAlpha(80),
                  Colors.transparent,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withAlpha(80),
                  blurRadius: 6,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
