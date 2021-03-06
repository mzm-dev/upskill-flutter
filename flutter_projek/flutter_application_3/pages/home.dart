import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/show.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Column(
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
          Container(
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
          Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: Text('Column 3'),
          ),
          Container(
            child: Row(
              children: [
                InkWell(
                  onDoubleTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ShowPage(gambar: 'fruit_1.jpg')));
                  },
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/fruit/fruit_1.jpg'),
                            fit: BoxFit.cover)),
                    //color: Colors.purple[100],
                    //child: Center(child: Text('Row 1')),
                  ),
                ),
                InkWell(
                  onLongPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ShowPage(gambar: 'fruit_2.jpg')));
                  },
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/fruit/fruit_2.jpg'),
                            fit: BoxFit.cover)),
                    //color: Colors.purple[200],
                    //child: Center(child: Text('Row 2')),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ShowPage(gambar: 'fruit_3.jpg')));
                  },
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/fruit/fruit_3.jpg'),
                            fit: BoxFit.cover)),
                    //color: Colors.purple[300],
                    //child: Center(child: Text('Row 3')),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ShowPage(gambar: 'fruit_4.jpg')));
                  },
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/fruit/fruit_4.jpg'),
                            fit: BoxFit.cover)),
                    //color: Colors.purple[400],
                    //child: Center(child: Text('Row 4')),
                  ),
                ),
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
    );
  }
}
