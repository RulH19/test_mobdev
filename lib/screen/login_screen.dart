import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_mobdev/util/typhography/app_typhography.dart';
import 'package:test_mobdev/util/validator/validator.dart';
import 'package:test_mobdev/util/widgets/custom_textfield_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void _login() async {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 80, 24, 0),

          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  height: 71,
                  width: 120,
                  'assets/svg/logo-login.svg',
                  semanticsLabel: 'logo login',
                ),
                SizedBox(height: 104),

                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back!',
                        style: AppTyphography.headlineHigh.copyWith(
                          height: 1,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Login to your account',
                        style: AppTyphography.kontenHigh.copyWith(
                          fontWeight: FontWeight.w300,
                          height: 1.2,
                          letterSpacing: 0,
                        ),
                      ),
                      SizedBox(height: 40),
                      Text(
                        'E-mail',
                        style: AppTyphography.headlineSmall.copyWith(
                          height: 1,
                          letterSpacing: 0,
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomTextFieldAuth(
                        hintText: 'Enter Work E-mail',
                        controller: _emailController,
                        validator: (_) => cekFormatEmail(_emailController.text),
                      ),
                      SizedBox(height: 24),

                      Text(
                        'Password',
                        style: AppTyphography.headlineSmall.copyWith(
                          height: 1,
                          letterSpacing: 0,
                        ),
                      ),
                      SizedBox(height: 10),

                      CustomTextFieldAuth(
                        hintText: 'Enter Password',
                        controller: _passwordController,
                        isPassword: true,
                        validator: (_) => cekPassword(_passwordController.text),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: Color(0xFFC51011),

                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'Log In',
                              style: AppTyphography.headlineSmall.copyWith(
                                fontSize: 16,
                                color: Colors.white,
                                height: 1,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                              endIndent: 10,
                            ),
                          ),
                          Text(
                            'Or',
                            style: AppTyphography.headlineSmall.copyWith(
                              fontSize: 12,
                              color: Colors.white,
                              height: 1,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                              indent: 10,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white, // warna border
                              width: 1, // ketebalan border
                            ),
                            borderRadius: BorderRadius.circular(
                              8,
                            ), // opsional: sudut melengkung
                          ),
                          child: Center(
                            child: Text(
                              'Explore without Login',
                              style: AppTyphography.headlineSmall.copyWith(
                                fontSize: 16,
                                color: Colors.white,
                                height: 1,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
