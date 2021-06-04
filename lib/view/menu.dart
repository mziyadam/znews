import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:znews/view/home_page.dart';

class menu extends StatefulWidget {
  @override
  _menuState createState() => _menuState();
}

class _menuState extends State<menu> {
  List<String> kats = [
    'Business',
    'Entertainment',
    'General',
    'Health',
    'Science',
    'Sports',
    'Technology'
  ];

  String username = 'Guest';
  String tempname = '';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ZNews',
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(1),
          children: [
            Container(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.greenAccent),
                child: Text(
                  'Hello, $username',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Change your name here:'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Write here...',
                        labelText: 'Your Name',
                      ),
                      onChanged: (String val) {
                        setState(() {
                          tempname = val;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        username = tempname;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlueAccent),
                    child: Text('Save'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 600) {
          return SafeArea(
            child: ListView.builder(
                itemCount: kats.length,
                itemBuilder: (context, index) {
                  ///business entertainment general health science sports technology
                  final kat = kats[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Homepage(
                                    kat: kat,
                                  )));
                    },
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        height: 250,
                        child: Column(
                          children: [
                            Expanded(
                                flex: 4, child: Image.asset('img/$kat.jpg')),
                            SizedBox(
                              height: 7,
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                kat,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
        } else {
          return SafeArea(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: kats.length,
                itemBuilder: (context, index) {
                  ///business entertainment general health science sports technology
                  final kat = kats[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Homepage(
                                    kat: kat,
                                  )));
                    },
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        height: 500,
                        child: Column(
                          children: [
                            Expanded(
                                flex: 4, child: Image.asset('img/$kat.jpg')),
                            SizedBox(
                              height: 7,
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                kat,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
        }
      }),
    );
  }
}
