import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_mobdev/util/typhography/app_typhography.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardCarosel extends StatelessWidget {
  String assets;
  String label;
  String headline;
  String description;
  CardCarosel({
    Key? key,
    required this.assets,
    required this.label,
    required this.headline,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24.w, 80.h, 24.w, 0.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: SvgPicture.asset(
                height: 300.h,
                width: 375.w,
                assets,
                semanticsLabel: label,
              ),
            ),
            SizedBox(height: 50.h),
            Text(
              headline,
              style: AppTyphography.headlineHigh.copyWith(
                height: 1.5,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              description,
              style: AppTyphography.kontenHigh.copyWith(
                height: 1.5,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
