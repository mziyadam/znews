import 'dart:convert';
import 'package:http/http.dart' as http;
import 'article.dart';

class Fetch {
  var firsturl = 'newsapi.org';
  var client = http.Client();
  String category="";
  Fetch() {
    category = 'technology';
  }
  Fetch.withCategory(String kat) {
    category = kat;
  }

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
  List<Article> articles=[];

    print(body[4]);
    print(body[5]);
  try {
    for (int i = 0; i < articles.length; i++) {
      print(body[i]);
      var article = Article.fromJson(body[i]);
      articles.add(article);
      print(article);
    }
  }catch(e){
    print(e);
  }
    // var articles = body.map((item) {
    //   // var article=Article.fromJson(item);
    //   print(item);
    // });
    return articles;
  }
}
