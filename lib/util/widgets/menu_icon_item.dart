// ignore_for_file: public_member_api_docs, sort_constructors_first
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
            width: 36,
            height: 36,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFFC51011),
              borderRadius: BorderRadius.circular(28),
            ),
            child: SvgPicture.asset(iconPath, width: 20, height: 20),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: AppTyphography.headlineSmall.copyWith(
              fontSize: 12,
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
