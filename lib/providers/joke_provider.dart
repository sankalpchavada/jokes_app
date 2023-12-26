import 'package:flutter/material.dart';

import '../api_helper/apihelper.dart';
import '../model/joke_model.dart';

class JokesProvider extends ChangeNotifier {
  List<Joke> jokes = [];

  Future<void> fetchJokes() async {
    try {
      Map<String, dynamic> fetchedJokes = await ApiHelper.fetchJokes();
      jokes = fetchedJokes as List<Joke>;
      notifyListeners();
    } catch (e) {
      print('Error fetching jokes: $e');
    }
  }
}
