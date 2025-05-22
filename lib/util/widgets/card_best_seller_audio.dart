import 'package:flutter/material.dart';
import 'package:test_mobdev/util/typhography/app_typhography.dart';

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
      width: 120,
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              width: 120,
              height: 185,
              fit: BoxFit.cover,
            ),
          ),

          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTyphography.headlineHigh.copyWith(
              fontSize: 16,
              height: 2,
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
              fontSize: 14,
              height: 2,
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
