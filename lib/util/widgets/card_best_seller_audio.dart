import 'package:flutter/material.dart';
import 'package:test_mobdev/util/typhography/app_typhography.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardBestSellerAudio extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String artist;
  const CardBestSellerAudio({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.artist,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.w,
      height: 150.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              imageUrl,
              width: 120.w,
              height: 150.h,
              fit: BoxFit.cover,
            ),
          ),

          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTyphography.headlineHigh.copyWith(
              fontSize: 16.sp,
              height: 2.sp,
              letterSpacing: 0.15,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Text(
            artist,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTyphography.kontenHigh.copyWith(
              fontSize: 14.sp,
              height: 2.sp,
              letterSpacing: 0.15,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
