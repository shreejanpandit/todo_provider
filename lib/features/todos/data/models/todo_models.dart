// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo {
  final String id;
  final String title;
  final String subtitle;
  final String des;
  bool done;
  Todo({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.des,
    this.done = false,
  });
}
