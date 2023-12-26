import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHelper {
  static Future<Map<String, dynamic>> fetchJokes() async {
    final response = await http.get(
      Uri.parse('https://api.chucknorris.io/jokes/random'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to Load");
    }
  }
}

/*

{
"categories": [
"explicit"
],
"created_at": "2020-01-05 13:42:29.296379",
"icon_url": "https://assets.chucknorris.host/img/avatar/chuck-norris.png",
"id": "cuLLs-WNRKK9Zdx6_RGZQA",
"updated_at": "2020-01-05 13:42:29.296379",
"url": "https://api.chucknorris.io/jokes/cuLLs-WNRKK9Zdx6_RGZQA",
"value": "Never say that your life is hard... Chuck Norris wakes up with a dick harder than your pathetic life"
}


 */
