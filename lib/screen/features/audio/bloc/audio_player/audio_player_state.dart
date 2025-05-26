class AudioPlayerState {
  final bool isPlay;
  final Duration duration;
  final Duration position;

  const AudioPlayerState({
    this.isPlay = false,
    this.duration = Duration.zero,
    this.position = Duration.zero,
  });

  AudioPlayerState copyWith({
    bool? isPlay,
    Duration? duration,
    Duration? position,
  }) {
    return AudioPlayerState(
      isPlay: isPlay ?? this.isPlay,
      duration: duration ?? this.duration,
      position: position ?? this.position,
    );
  }
}
