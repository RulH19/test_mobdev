import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_mobdev/util/typhography/app_typhography.dart';

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
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(24, 80, 24, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SvgPicture.asset(
              height: 320,
              width: 375,
              assets,
              semanticsLabel: label,
            ),
          ),
          SizedBox(height: 65),
          Text(
            headline,
            style: AppTyphography.headlineHigh.copyWith(
              height: 1.5,
              letterSpacing: 2,
            ),
          ),
          SizedBox(height: 25),
          Text(
            description,
            style: AppTyphography.kontenHigh.copyWith(
              height: 1.5,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }
}
