class ConCategory {
  late int id;
  late String title;

  ConCategory({
    required this.id,
    required this.title,
  });

  ConCategory fromJson(Map<String, Object?> json) => ConCategory(
        id: json[id] as int,
        title: json[title] as String,
      );
}
