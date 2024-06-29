class GalleryGetApiModel {
  final int id;
  final String name;
  final String image;
  final int view;

  GalleryGetApiModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.view});

  GalleryGetApiModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'],
        view = json['view'];
}
