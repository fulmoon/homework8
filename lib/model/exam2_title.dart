class Exam2Title{
  final int id;
  final String title;

  Exam2Title({
    required this.id,
    required this.title,
  });

  factory Exam2Title.fromJson(Map<String, dynamic> json){
    return Exam2Title(
      id: json['id'] as int,
      title: json['title'] as String,
    );
  }
}