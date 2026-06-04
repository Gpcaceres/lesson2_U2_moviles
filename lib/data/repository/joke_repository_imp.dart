import '../../domains/entities/joke.dart';
import '../datasources/chucknorris_datasource.dart';
import 'joke_repository.dart';

class JokeRepositoryImp implements JokeRepository {
  final ChuckNorrisDataSource chuckNorrisDataSource;

  JokeRepositoryImp({required this.chuckNorrisDataSource});

  @override
  Future<List<Joke>> getJokes({int count = 20}) async {
    return await chuckNorrisDataSource.fetchRandomJokes(count);
  }
}
