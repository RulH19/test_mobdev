import 'package:equatable/equatable.dart';
import 'package:test_mobdev/data/response/course_response.dart';

abstract class CourseState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CourseSuccess extends CourseState {
  final List<CourseResponse> data;

  CourseSuccess(this.data);

  @override
  List<Object?> get props => [data];
}

class CourseFailure extends CourseState {
  final String message;

  CourseFailure(this.message);

  @override
  List<Object?> get props => [message];
}
