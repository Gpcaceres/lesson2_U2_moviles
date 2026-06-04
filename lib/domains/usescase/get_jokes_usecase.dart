import '../entities/joke.dart';
import '../../data/repository/joke_repository.dart';

class GetJokesUseCase {
  final JokeRepository repositoryImpl;

  GetJokesUseCase({required this.repositoryImpl});

  Future<List<Joke>> call() {
    return repositoryImpl.getJokes();
  }
}
