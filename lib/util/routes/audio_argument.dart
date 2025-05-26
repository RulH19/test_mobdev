import 'package:test_mobdev/data/response/audio_response.dart';

class AudioArgument {
  final List<AudioResponse> audioList;
  final int currentIndex;

  AudioArgument({required this.audioList, required this.currentIndex});
}
