import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_mobdev/data/api/api_service.dart';
import 'package:test_mobdev/screen/features/course/bloc/course_event.dart';
import 'package:test_mobdev/screen/features/course/bloc/course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final ApiService apiService;

  CourseBloc(this.apiService) : super(CourseInitial()) {
    on<FetchCourses>((event, emit) async {
      emit(CourseLoading());
      try {
        final courses = await apiService.fetchCourse();
        emit(CourseSuccess(courses));
      } catch (e) {
        emit(CourseFailure(e.toString()));
      }
    });
  }
}
