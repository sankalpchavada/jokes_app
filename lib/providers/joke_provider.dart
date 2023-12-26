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

// class JokesList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final jokesProvider = Provider.of<JokesProvider>(context);
//
//     return Column(
//       children: [
//         ElevatedButton(
//           onPressed: () => jokesProvider.fetchJokes(),
//           child: Text('Fetch Chuck Norris Joke'),
//         ),
//         if (jokesProvider.jokes.isNotEmpty)
//           ListTile(
//             title: Text(jokesProvider.jokes[0].value),
//             subtitle: Text(
//                 'Category: ${jokesProvider.jokes[0].categories.join(', ')}'),
//             leading: CircleAvatar(
//               backgroundImage: NetworkImage(jokesProvider.jokes[0].iconUrl),
//             ),
//           ),
//       ],
//     );
//   }
// }
