import 'package:flutter/material.dart';
import 'package:znews/model/article.dart';
import 'list_tile.dart';
import 'package:znews/model/fetcher.dart';
import 'loading.dart';

class Homepage extends StatefulWidget {
  final String kat;

  Homepage({required this.kat});

  @override
  _Homepage createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(
          //     Icons.arrow_back,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
          title: Text(widget.kat)),
      body: FutureBuilder(
        future: Fetch.withCategory(widget.kat).getArtikel(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            var articles = snapshot.data;

            return ListView.builder(
              itemBuilder: (context, index) =>
                  CustomListTile(articles![index], context),
              itemCount: articles?.length,
            );
          }
          return Center(
            child: loading(),
          );
        },
      ),
    );
  }
}
