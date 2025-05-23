import 'package:flutter/material.dart';
import 'package:test_mobdev/util/typhography/app_typhography.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFieldAuth extends StatefulWidget {
  const CustomTextFieldAuth({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.validator,
  });
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String?)? validator;

  @override
  State<CustomTextFieldAuth> createState() => _CustomTextFieldAuthState();
}

class _CustomTextFieldAuthState extends State<CustomTextFieldAuth> {
  bool _obsecureText = true;
  void _toggleVisibility() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          style: AppTyphography.kontenHigh.copyWith(
            fontSize: 16.sp,
            color: Colors.white,
            height: 1,
            letterSpacing: 0,
            fontWeight: FontWeight.w400,
          ),
          validator: widget.validator,
          controller: widget.controller,
          obscureText: widget.isPassword ? _obsecureText : false,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Color(0xFF787777), width: 2.w),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFF787777), width: 2.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFF787777), width: 2.w),
            ),
            hintText: widget.hintText,
            hintStyle: AppTyphography.kontenHigh.copyWith(
              fontSize: 16.sp,
              color: Color(0xFF787777),
              height: 1,
              letterSpacing: 0,
            ),
            suffixIcon:
                widget.isPassword
                    ? IconButton(
                      color: Colors.white,
                      onPressed: _toggleVisibility,
                      icon: Opacity(
                        opacity: 0.2,
                        child: Icon(
                          _obsecureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    )
                    : null,
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
