import 'package:flutter/material.dart';
import '../../domains/entities/joke.dart';
import '../../domains/usescase/get_jokes_usecase.dart';

class JokesViewModel extends ChangeNotifier {
  final GetJokesUseCase getJokesUseCase;

  JokesViewModel({required this.getJokesUseCase});

  List<Joke> _jokes = [];
  bool loading = false;
  String? errorMessage;

  List<Joke> get jokes => _jokes;

  Future<void> loadJokes() async {
    loading = true;
    notifyListeners();

    try {
      _jokes = await getJokesUseCase();
      loading = false;
      errorMessage = null;
    } catch (e) {
      errorMessage = "Error al cargar los chistes de Chuck Norris";
      loading = false;
    }
    notifyListeners();
  }
}
