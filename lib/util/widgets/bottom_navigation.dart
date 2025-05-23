import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_mobdev/screen/features/course/pages/course_screen.dart';
import 'package:test_mobdev/screen/features/home/pages/home_screen.dart';
import 'package:test_mobdev/screen/features/profile/pages/profile_screen.dart';
import 'bottom_nav_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavCubit(),
      child: Scaffold(
        body: BlocBuilder<BottomNavCubit, int>(
          builder: (context, index) {
            return switch (index) {
              0 => const HomeScreen(),
              1 => const CourseScreen(),
              _ => const ProfileScreen(),
            };
          },
        ),
        bottomNavigationBar: BlocBuilder<BottomNavCubit, int>(
          builder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.w),
              child: BottomNavigationBar(
                backgroundColor: Color(0xFF0D0D0E),
                currentIndex: index,
                onTap: (newIndex) {
                  context.read<BottomNavCubit>().changeIndex(newIndex);
                },
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
                items: [
                  BottomNavigationBarItem(
                    icon: SizedBox(
                      height: 24.h,
                      width: 24.w,
                      child: SvgPicture.asset(
                        'assets/svg/icon-home.svg',
                        colorFilter: ColorFilter.mode(
                          index == 0 ? Colors.white : Colors.grey,
                          BlendMode.srcIn,
                        ), // Sesuaikan warna
                      ),
                    ),
                    label: "Home",
                    tooltip: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox(
                      height: 24.h,
                      width: 24.w,
                      child: SvgPicture.asset(
                        'assets/svg/icon-courses.svg',
                        colorFilter: ColorFilter.mode(
                          index == 1 ? Colors.white : Colors.grey,
                          BlendMode.srcIn,
                        ), // Sesuaikan warna
                      ),
                    ),
                    label: "Courses",
                    tooltip: "Courses",
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox(
                      height: 24.h,
                      width: 24.w,
                      child: SvgPicture.asset(
                        'assets/svg/icon-profile.svg',
                        colorFilter: ColorFilter.mode(
                          index == 2 ? Colors.white : Colors.grey,
                          BlendMode.srcIn,
                        ), // Sesuaikan warna
                      ),
                    ),
                    label: "Profile",
                    tooltip: "Profile",
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
