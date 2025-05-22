class AudioResponse {
  final String id;
  final String title;
  final String artist;
  final String description;
  final String? isPremium;
  final String? language;
  final String? audioUrl;
  final String thumbnailUrl;

  AudioResponse({
    required this.id,
    required this.title,
    required this.artist,
    required this.description,
    this.isPremium,
    this.language,
    this.audioUrl,
    required this.thumbnailUrl,
  });

  factory AudioResponse.fromJson(Map<String, dynamic> json) {
    return AudioResponse(
      id: json['_id'],
      title: json['title'],
      artist: json['artist'],
      description: json['description'],
      isPremium: json['isPremium'],
      language: json['languange'],
      audioUrl:
          (json['path'] as List).isNotEmpty ? json['path'][0]['url'] : null,
      thumbnailUrl:
          (json['thumbnail'] as List).isNotEmpty
              ? json['thumbnail'][0]['url']
              : null,
    );
  }
}
