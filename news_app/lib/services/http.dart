import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../models/news.dart';

List<List<Articles>> savedCatagories = [];
List countryList = [
  "ae",
  "ar",
  "at",
  "au",
  "be",
  "bg",
  "br",
  "ca",
  "ch",
  "cn",
  "co",
  "cu",
  "cz",
  "de",
  "eg",
  "fr",
  "gb",
  "gr",
  "hk",
  "hu",
  "id",
  "ie",
  "il",
  "in",
  "it",
  "jp",
  "kr",
  "lt",
  "lv",
  "ma",
  "mx",
  "my",
  "ng",
  "nl",
  "no",
  "nz",
  "ph",
  "pl",
  "pt",
  "ro",
  "rs",
  "ru",
  "sa",
  "se",
  "sg",
  "si",
  "sk",
  "th",
  "tr",
  "tw",
  "ua",
  "us",
  "ve",
  "za",
];

Future fecthNews(country, keyword) async {
  final newsapi = dotenv.env['newsapi'];
  var url = Uri.parse(
      'https://newsapi.org/v2/top-headlines?q=$keyword&apiKey=$newsapi');

  var response = await http.get(url);

  if (response.statusCode == 200) {
    Map jsonBody = convert.jsonDecode(response.body);
    List body = jsonBody['articles'];
    savedCatagories.add(body.map((e) => Articles.fromJson(e)).toList());
  } else {
    throw "fetchNews status: ${response.statusCode}";
  }
}
