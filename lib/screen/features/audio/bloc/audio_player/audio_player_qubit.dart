import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_mobdev/screen/features/audio/bloc/audio_player/audio_player_state.dart';

class AudioPlayerQubit extends Cubit<AudioPlayerState> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioPlayerQubit() : super(const AudioPlayerState()) {
    _audioPlayer.onPositionChanged.listen((position) {
      emit(state.copyWith(position: position));
    });

    _audioPlayer.onDurationChanged.listen((duration) {
      emit(state.copyWith(duration: duration));
    });
    _audioPlayer.onPlayerStateChanged.listen((playerState) {
      emit(state.copyWith(isPlay: playerState == PlayerState.playing));
    });
  }

  Future<void> play(String url) async {
    await _audioPlayer.play(UrlSource(url));
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  Future<void> resume() async {
    await _audioPlayer.resume();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
    emit(state.copyWith(position: Duration.zero));
  }

  @override
  Future<void> close() {
    _audioPlayer.dispose();
    return super.close();
  }
}
