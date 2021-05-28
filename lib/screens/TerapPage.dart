import 'package:flutter/material.dart';

class TerapPage extends StatelessWidget {
  PageController _pageController;

  int _page = 0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Pagina do Terapeuta'),
          leading: Icon(Icons.menu),
        ),
        body: new PageView(children: [
          new Container(
            color: Colors.blueGrey,
            child: Card(
              color: Colors.lightBlue,
              elevation: 5,
              margin:
                  EdgeInsets.only(bottom: 200, top: 200, left: 50, right: 50),
            ),
          ),
          new Container(
            color: Colors.blueGrey,
            child: Card(
              color: Colors.lightBlue,
              elevation: 5,
              margin:
                  EdgeInsets.only(bottom: 200, top: 200, left: 50, right: 50),
            ),
          ),
          new Container(
            color: Colors.blueGrey,
            child: Card(
              color: Colors.lightBlue,
              elevation: 5,
              margin:
                  EdgeInsets.only(bottom: 200, top: 200, left: 50, right: 50),
            ),
          )
        ]),
        bottomNavigationBar: new BottomNavigationBar(items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.add), title: new Text("trends")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.location_on), title: new Text("feed")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.chat), title: new Text("chat"))
        ]));
  }
}
