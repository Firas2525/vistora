class NotificationModel {
  final int id;
  final String title;
  final String date;
  final String content;

  NotificationModel({
    required this.id,
    required this.title,
    required this.date,
    required this.content,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as int,
      title: json['title'] as String,
      date: "${json['date'].toString().substring(0, 10)} ${json['date'].toString().substring(11, 16)}",
      content: json['content'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'content': content,
    };
  }

}
