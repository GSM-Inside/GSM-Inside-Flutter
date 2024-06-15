class ApiModel {
  final String title;
  final String content;
  final int? id;
  final String? date;

  ApiModel({
    required this.title,
    required this.content,
    this.id,
    this.date,
  });

  ApiModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'],
        id = json['id'],
        date = json['date_posted'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'id': id,
        'date': date,
      };
}
