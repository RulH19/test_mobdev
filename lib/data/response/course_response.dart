class CourseResponse {
  final String id;
  final String title;
  final String? author;
  final List<Chapter> chapters;
  final String imageUrl;

  CourseResponse({
    required this.id,
    required this.title,
    required this.author,
    required this.chapters,
    required this.imageUrl,
  });

  factory CourseResponse.fromJson(Map<String, dynamic> json) => CourseResponse(
    id: json['_id'],
    title: json['title'],
    author: json['author'],
    chapters:
        (json['chapter'] as List).map((e) => Chapter.fromJson(e)).toList(),
    imageUrl: json['path'][0]['url'],
  );
}

class Chapter {
  final String id;
  final String title;

  Chapter({required this.id, required this.title});

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      Chapter(id: json['_id'], title: json['title']);
}
