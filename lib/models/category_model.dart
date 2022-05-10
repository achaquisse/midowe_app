class Category {
  final String id;
  final String name;
  final String description;
  final bool requireApproval;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.requireApproval,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      requireApproval: json['requireApproval'],
    );
  }
}
