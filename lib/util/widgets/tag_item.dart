import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:test_mobdev/util/typhography/app_typhography.dart';

class TagItem extends StatelessWidget {
  String text;
  double? width;
  TagItem({super.key, required this.text, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 76.w,
      height: 34.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xFF222326),
      ),
      padding: EdgeInsets.symmetric(vertical: 8.w),
      child: Center(
        child: Text(
          text,
          style: AppTyphography.headlineSmall.copyWith(
            fontSize: 14.sp,
            height: 1.5.sp,
            letterSpacing: 0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
