import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../model/article.dart';

class Details extends StatefulWidget {
  final Article article;

  Details({this.article});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(widget.article.title),
        ),
        body: WebView(
          initialUrl: widget.article.url,
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }
}
