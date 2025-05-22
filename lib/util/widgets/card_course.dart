import 'package:flutter/material.dart';
import 'package:test_mobdev/util/typhography/app_typhography.dart';

class CardCourse extends StatelessWidget {
  const CardCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          width: 343,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      'assets/image/logo.png',
                      width: 88,
                      height: 88,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 1,
                    left: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        "New",
                        style: AppTyphography.headlineSmall.copyWith(
                          fontSize: 12,
                          height: 1.5,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Figma UX Design UI Essential Course",
                      style: AppTyphography.headlineSmall.copyWith(
                        fontSize: 14,
                        height: 1.5,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),

                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 10,
                          backgroundImage: AssetImage(
                            'assets/images/author.jpg',
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "David Rockwell",
                          style: AppTyphography.kontenSmall.copyWith(
                            fontSize: 12,
                            height: 1.5,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 58),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.tealAccent),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            "Beginner",
                            style: TextStyle(
                              color: Colors.tealAccent,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.flag, size: 14, color: Colors.white),
                      ],
                    ),
                    const SizedBox(height: 6),

                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.design_services,
                                color: Colors.white,
                                size: 12,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "Design",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 70),

                        Row(
                          children: const [
                            Icon(
                              Icons.menu_book,
                              color: Colors.white,
                              size: 14,
                            ),
                            SizedBox(width: 4),
                            Text(
                              "16",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),

                            SizedBox(width: 12),
                            Icon(Icons.schedule, color: Colors.white, size: 14),
                            SizedBox(width: 4),
                            Text(
                              "1:20:10",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 343,
          height: 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.transparent,
                Colors.white.withOpacity(0.3),
                Colors.white.withOpacity(0.7),
                Colors.white.withOpacity(0.3),
                Colors.transparent,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.3),
                blurRadius: 6,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
