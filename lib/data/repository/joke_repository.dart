import '../../domains/entities/joke.dart';

abstract class JokeRepository {
  Future<List<Joke>> getJokes();
}
