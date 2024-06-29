class BoardGetApi {
  final int id;
  final String title;
  final int gallery;
  final int like;
  final bool? isAdmin;
  final List<dynamic>? images;
  final String? content;
  final String? name;
  final int? dislike;
  final String password = '0000';

  BoardGetApi({
    required this.id,
    required this.title,
    required this.gallery,
    required this.like,
    this.isAdmin,
    this.images,
    this.content,
    this.name,
    this.dislike,
  });

  BoardGetApi.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        gallery = json['gallery'],
        like = json['like'],
        isAdmin = json['is_admin'],
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
