import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../models/news.dart';

List<List<Articles>> savedCatagories = [];

Future fecthNews() async {
  final newsapi = dotenv.env['newsapi'];
  var url = Uri.parse('https://newsapi.org/v2/everything?q=tesla&from=2022-08-25&sortBy=publishedAt&apiKey=$newsapi');

  var response = await http.get(url);

  if (response.statusCode == 200) {
    Map jsonBody = convert.jsonDecode(response.body);
    List body = jsonBody['articles'];
    savedCatagories.add(body.map((e) => Articles.fromJson(e)).toList());
  } else {
    throw "fetchNews status: ${response.statusCode}";
  }
}
