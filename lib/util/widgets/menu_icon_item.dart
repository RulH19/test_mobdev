import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:test_mobdev/util/typhography/app_typhography.dart';

class MenuIconItem extends StatelessWidget {
  final String label;
  final String iconPath;
  Function()? onTap;
  MenuIconItem({
    super.key,
    required this.label,
    required this.iconPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: Color(0xFFC51011),
              borderRadius: BorderRadius.circular(28.r),
            ),
            child: SvgPicture.asset(iconPath, width: 20.w, height: 20.h),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: AppTyphography.headlineSmall.copyWith(
              fontSize: 12.sp,
              height: 1.5,
              letterSpacing: 0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
