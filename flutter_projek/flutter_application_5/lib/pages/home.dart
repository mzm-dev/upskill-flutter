import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/pages/list.dart';
import 'package:flutter_application_4/pages/listdata.dart';
import 'package:flutter_application_4/pages/login.dart';
import 'package:flutter_application_4/pages/show.dart';
import 'package:flutter_application_4/widgets/menu.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
        actions: [
          IconButton(
              onPressed: () {
                //Navigator
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              icon: Icon(Icons.home)),
          IconButton(
              onPressed: () {
                //Navigator
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: Icon(Icons.login)),
        ],
      ),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width * 0.25,
      drawer: MenuWidget(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/fruit/fruit.jpg'),
                      fit: BoxFit.cover)),
              //color: Colors.orange,
              //child: Text('Column 2'),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListPage()));
              },
              onDoubleTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListDataPage()));
              },
              child: Container(
                padding: EdgeInsets.all(5),
                height: 80,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/fruit/fruit_main.jpg'),
                        fit: BoxFit.cover)),
                //color: Colors.orange,
                child: const Text('My Fruits',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        letterSpacing: 3.5,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Bubblegum')),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Text('Column 3'),
            ),
            Container(
              child: Row(
                children: [
                  KlikGambarWidget(title: 'Fruit 1', nama: 'fruit/fruit_1.jpg'),
                  KlikGambarWidget(title: 'Fruit 2', nama: 'fruit/fruit_2.jpg'),
                  KlikGambarWidget(title: 'Fruit 3', nama: 'fruit/fruit_3.jpg'),
                  KlikGambarWidget(title: 'Fruit 4', nama: 'fruit/fruit_4.jpg'),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/fruit/fruit_5.jpg'),
                            fit: BoxFit.cover)),
                    //color: Colors.teal[400],
                    //child: Center(child: Text('Row 1')),
                  ),
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.75,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.topCenter,
                            image: AssetImage('images/fruit/fruit_6.jpg'),
                            fit: BoxFit.cover)),
                    //color: Colors.teal[200],
                    //child: Center(child: Text('Row 2')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KlikGambarWidget extends StatelessWidget {
  KlikGambarWidget({
    Key? key,
    required this.title,
    required this.nama,
  }) : super(key: key);

  String title;
  String nama;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShowPage(gambar: nama, title: title)));
      },
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/$nama'), fit: BoxFit.cover)),
      ),
    );
  }
}
