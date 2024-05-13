import 'package:znews/model/article.dart';

class Response {
  String? status;
  int? totalResults;
  List<Article>? article;

  Response({this.status, this.totalResults, this.article});

  Response.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['article'] != null) {
      article = <Article>[];
      json['article'].forEach((v) {
        article!.add(new Article.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    if (this.article != null) {
      data['article'] = this.article!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
