class BoardApi {
  final int id;
  final String title;
  final int gallery;
  final int like;
  final bool? is_admin;
  final List<dynamic>? images;
  final String? content;
  final String? name;
  final int? dislike;
  final String password = '0000';

  BoardApi({
    required this.id,
    required this.title,
    required this.gallery,
    required this.like,
    this.is_admin,
    this.images,
    this.content,
    this.name,
    this.dislike,
  });

  BoardApi.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        gallery = json['gallery'],
        like = json['like'],
        is_admin = json['is_admin'],
        images = json['images'],
        content = json['content'],
        name = json['name'],
        dislike = json['dislike'];

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "content": content,
      "gallery": gallery,
      "name": name,
      "password": password,
      "images": images
    };
  }
}
