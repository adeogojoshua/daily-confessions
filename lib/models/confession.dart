class Confession {
  late int id;
  late String body;

  Confession({
    required this.id,
    required this.body,
  });

  Confession fromJson(Map<String, Object?> json) => Confession(
        id: json[id] as int,
        body: json[body] as String,
      );
}
