import 'package:docdoctes/model/terapuser.dart';
import 'package:flutter/material.dart';

class PacientePage extends StatelessWidget {
  PageController _pageController;

  int _page = 0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Pagina do Paciente'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.search),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.more_vert),
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: terapusers.length,
          itemBuilder: (context, index) {
            return _terapCard(context, index);
          }),
    );
  }

  Widget _terapCard(BuildContext context, int index) {
    return GestureDetector(
      onDoubleTap: () {},
      child: Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: terapusers[index].id,
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                        image: AssetImage(terapusers[index].imageUrl))),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 40, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    terapusers[index].name,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 40, 0),
              child: Text(
                terapusers[index].discription,
                style: TextStyle(
                    fontFamily: 'Montserrat', fontSize: 16, color: Colors.grey),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: ElevatedButton(
                      child: Text('Enviar Mensagem'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.lightBlue),
                      ),
                      onPressed: () {}),
                ))
          ],
        ),
      ),
    );
  }
}
