import 'package:dio/dio.dart';
import 'package:test_mobdev/data/response/audio_response.dart';
import 'package:test_mobdev/data/response/course_response.dart';
import 'package:test_mobdev/data/response/login_response.dart';
import 'package:test_mobdev/data/response/login_result.dart';
import 'dart:developer';

class ApiService {
  final Dio _dio = Dio();
  final String _baseUrl =
      "https://api.kontenbase.com/query/api/v1/2810aabc-9dc5-4d37-8ff1-fd579e9d6f0c";

  Future<LoginResult> loginUser(String email, String password) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/auth/login',
        data: {'email': email, 'password': password},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      final data = response.data;
      if (data['token'] != null) {
        final dataLogin = LoginResponse.fromJson(data);
        return LoginResult.success(dataLogin);
      } else {
        return LoginResult.failure(
          data['message'] ?? "Login Failed Check Email or Password",
        );
      }
    } on DioException catch (e) {
      return LoginResult.failure(
        e.response?.data['message'] ?? 'Network error',
      );
    } catch (e) {
      return LoginResult.failure('Unexpected error: $e');
    }
  }

  Future<List<CourseResponse>> fetchCourse() async {
    try {
      final response = await _dio.get(
        '$_baseUrl/courses?\$lookup=*',
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      final data = response.data as List;
      log(data.toString());
      return data.map((e) => CourseResponse.fromJson(e)).toList();
    } catch (e) {
      log('Error fetching courses: $e');
      return [];
    }
  }

  Future<List<AudioResponse>> fetchAudio() async {
    try {
      final response = await _dio.get(
        '$_baseUrl/audio?\$lookup=*',
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      final data = response.data as List;
      log(data.toString());
      return data.map((e) => AudioResponse.fromJson(e)).toList();
    } catch (e) {
      log('Error fetching courses: $e');
      return [];
    }
  }
}
