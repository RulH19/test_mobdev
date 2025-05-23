import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardAudio extends StatelessWidget {
  String imageUrl;
  String title;
  String artist;
  Function()? onTap;
  CardAudio({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.artist,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 360.w,
            height: 90.h,
            padding: EdgeInsets.all(5.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    imageUrl,
                    width: 50.w,
                    height: 50.h,
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(width: 10.w),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 160.w,
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    SizedBox(
                      width: 160.w,
                      child: Text(
                        artist,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Text(
                          "16 Chapters",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.bookmark_border,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      children: [
                        Icon(
                          Icons.headphones,
                          color: Colors.white70,
                          size: 14.sp,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "45 min",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12.sp,
                          ),
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
