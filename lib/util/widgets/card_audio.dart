import 'package:flutter/material.dart';

class CardAudio extends StatelessWidget {
  String imageUrl;
  String title;
  String artist;
  CardAudio({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.artist,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 90,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 185,
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 4),
              SizedBox(
                width: 185,
                child: Text(
                  artist,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Text(
                    "16 Chapters",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(Icons.bookmark_border, color: Colors.white, size: 24),
              Row(
                children: const [
                  Icon(Icons.headphones, color: Colors.white70, size: 14),
                  SizedBox(width: 4),
                  Text(
                    "45 min",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
