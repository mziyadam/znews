import 'dart:convert';
import 'package:http/http.dart' as http;
import 'article.dart';

class Fetch {
  var firsturl = 'newsapi.org';
  var client = http.Client();
  String category='technology';


  Fetch.withCategory(this.category);


  Future<List<Article>> getArtikel() async {
    var queryParameters = {
      'country': 'us',
      'category': category,
      'apiKey': '627f57d562a94cf5b486e6a043054b32'
    };
    var uri = Uri.https(firsturl, '/v2/top-headlines', queryParameters);
    var response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    var articles = body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }
}
