import 'package:equatable/equatable.dart';
import 'package:test_mobdev/data/response/audio_response.dart';

abstract class AudioState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AudioInitial extends AudioState {}

class AudioLoading extends AudioState {}

class AudioSuccess extends AudioState {
  final List<AudioResponse> data;

  AudioSuccess(this.data);

  @override
  List<Object?> get props => [data];
}

class AudioFailure extends AudioState {
  final String message;

  AudioFailure(this.message);

  @override
  List<Object?> get props => [message];
}
