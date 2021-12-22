import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import '../model/list_of_artical.dart';


class NewsApi {
  fetchArtical() async {
    var url =
        ('https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=a5bbe956c6704acb8b9f1d4cce250135');
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        //var jsonData = convert.jsonDecode(response.body);

        return ListArticle.fromJson(convert.jsonDecode(response.body));
      }
    } catch (e) {}
  }

  fetchArticalByCategory(String category) async {
    var url =
        ('https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=a5bbe956c6704acb8b9f1d4cce250135');

    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonData = convert.jsonDecode(response.body);

        return ListArticle.fromJson(jsonData);
      }
    } catch (e) {}
  }
}
