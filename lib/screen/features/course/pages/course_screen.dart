import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test_mobdev/screen/features/course/bloc/course_bloc.dart';
import 'package:test_mobdev/screen/features/course/bloc/course_event.dart';
import 'package:test_mobdev/screen/features/course/bloc/course_state.dart';
import 'package:test_mobdev/util/routes/router.dart';
import 'package:test_mobdev/util/typhography/app_typhography.dart';
import 'package:test_mobdev/util/widgets/card_course.dart';
import 'package:test_mobdev/util/widgets/tag_item.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CourseBloc>().add(FetchCourses());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0D0D0E),

        title: Text(
          'Courses',
          style: AppTyphography.headlineHigh.copyWith(
            fontSize: 16,
            height: 1.5,
            letterSpacing: 0,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            context.goNamed(RouteName.bottomNavigation);
          },
        ),
        actions: [
          GestureDetector(
            onTap: () {
              context.goNamed(RouteName.bottomNavigation);
            },
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SvgPicture.asset(
                'assets/svg/menu.svg',
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<CourseBloc, CourseState>(
        builder: (context, state) {
          if (state is CourseLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CourseSuccess) {
            return Column(
              children: [
                Container(
                  width: 343,
                  height: 48,
                  margin: EdgeInsets.symmetric(horizontal: 26),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Color(0xFF787777)),
                      SizedBox(width: 10),
                      Text(
                        "Title, mentor, or keywords...",
                        style: AppTyphography.kontenHigh.copyWith(
                          fontSize: 16,
                          height: 2,
                          letterSpacing: 0.15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF787777),
                        ),
                      ),
                      SizedBox(width: 90),
                      SvgPicture.asset(
                        'assets/svg/filter.svg',
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TagItem(text: 'For You'),
                    SizedBox(width: 8),
                    TagItem(text: 'Recent'),
                    SizedBox(width: 8),
                    TagItem(text: 'Trending', width: 85),
                    SizedBox(width: 8),
                    TagItem(text: 'Technology', width: 102),
                    SizedBox(width: 8),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      final course = state.data[index];
                      String imageUrl = course.imageUrl;
                      String title = course.title;
                      String author = course.author ?? "David Rockwel";
                      return CardCourse(
                        imageUrl: imageUrl,
                        title: title,
                        author: author,
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is CourseFailure) {
            return Center(child: Text('Tidak ada Data'));
          } else {
            return Center(child: Text('Gagal'));
          }
        },
      ),
    );
  }
}
