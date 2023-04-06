class TechStackEntity {
  final int id;
  final String name;
  final String imagePath;
  final String url;
  final int? delay;

  TechStackEntity(
      {required this.id,
      required this.name,
      required this.imagePath,
      required this.url,
      this.delay});

  TechStackEntity.fromJson(Map<String, Object?> json)
      : this(
          id: (json['id'] != null) ? json['id']! as int : 0,
          name: (json['name'] != null) ? json['name']! as String : '',
          imagePath:
              (json['imagePath'] != null) ? json['imagePath']! as String : '',
          url: (json['url'] != null) ? json['url']! as String : '',
          delay: (json['delay'] != null) ? json['delay']! as int : 0,
        );

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'imagePath': imagePath,
      'url': url,
      'delay': delay
    };
  }
}
