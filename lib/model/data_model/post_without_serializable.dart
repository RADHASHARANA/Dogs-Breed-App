/*
///Json Serialization  manually
class Post {
  const Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  final int? id;
  final int? userId;
  final String? title;
  final String? body;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json['id'],
        userId: json["userId"],
        title: json["title"],
        body: json["body"],
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'title': title,
        'body': body,
      };
}
*/