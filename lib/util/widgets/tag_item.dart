import 'package:flutter/material.dart';

import 'package:test_mobdev/util/typhography/app_typhography.dart';

class TagItem extends StatelessWidget {
  String text;
  double? width;
  TagItem({super.key, required this.text, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 76,
      height: 34,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xFF222326),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        text,
        style: AppTyphography.headlineSmall.copyWith(
          fontSize: 14,
          height: 1.5,
          letterSpacing: 0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
