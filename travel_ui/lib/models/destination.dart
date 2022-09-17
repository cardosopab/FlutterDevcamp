class Destination {
  final String name;
  final String url;

  Destination({required this.name, required this.url});
  Destination.fromJson(Map<String, Object?> json)
      : this(
          name: json['name'] as String,
          url: json['url'] as String,
        );

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}
