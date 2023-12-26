class Joke {
  final String id;
  final String value;
  final String iconUrl;
  final String url;
  final List<String> categories;
  final DateTime createdAt;

  Joke({
    required this.id,
    required this.value,
    required this.iconUrl,
    required this.url,
    required this.categories,
    required this.createdAt,
  });

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      id: json['id'],
      value: json['value'],
      iconUrl: json['icon_url'],
      url: json['url'],
      categories: List<String>.from(json['categories']),
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
