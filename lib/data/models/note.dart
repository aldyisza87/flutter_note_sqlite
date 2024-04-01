import 'dart:convert';

class Note {
  final String? id;
  final String title;
  final String content;
  final DateTime createAt;
  Note({
    this.id,
    required this.title,
    required this.content,
    required this.createAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'content': content,
      'createAt': createAt.millisecondsSinceEpoch,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] as String,
      content: map['content'] as String,
      createAt: DateTime.fromMillisecondsSinceEpoch(int.parse(map['createAt'])),
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);
}
