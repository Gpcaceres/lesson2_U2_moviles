import '../../domains/entities/joke.dart';

class JokeModel extends Joke {
  JokeModel({
    required super.id,
    required super.value,
    required super.iconUrl,
    required super.categories,
  });

  factory JokeModel.fromJson(Map<String, dynamic> json) {
    return JokeModel(
      id: json['id'] ?? '',
      value: json['value'] ?? '',
      iconUrl: json['icon_url'] ?? '',
      categories: json['categories'] != null
          ? List<String>.from(json['categories'])
          : [],
    );
  }
}
