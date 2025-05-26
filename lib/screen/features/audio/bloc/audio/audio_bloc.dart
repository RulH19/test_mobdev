import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_mobdev/data/api/api_service.dart';
import 'package:test_mobdev/screen/features/audio/bloc/audio/audio_event.dart';
import 'package:test_mobdev/screen/features/audio/bloc/audio/audio_state.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final ApiService apiService;

  AudioBloc(this.apiService) : super(AudioInitial()) {
    on<FetchAudio>((event, emit) async {
      emit(AudioLoading());
      try {
        final audio = await apiService.fetchAudio();
        emit(AudioSuccess(audio));
      } catch (e) {
        emit(AudioFailure(e.toString()));
      }
    });
  }
}
