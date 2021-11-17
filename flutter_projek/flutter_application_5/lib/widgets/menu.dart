import 'package:flutter/material.dart';
import 'package:flutter_application_4/pages/home.dart';
import 'package:flutter_application_4/pages/list.dart';
import 'package:flutter_application_4/pages/listdata.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            width: MediaQuery.of(context).size.width,
            height: 80,
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/fruit/fruit_main.jpg'),
                    fit: BoxFit.cover)),
            child: const Text('Fruit App',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    letterSpacing: 3.5,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Bubblegum')),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              //Navigator
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('My Fruit'),
            onTap: () {
              //Navigator
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ListPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.batch_prediction),
            title: Text('Fruit Data'),
            onTap: () {
              //Navigator
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListDataPage()));
            },
          ),
        ],
      ),
    );
  }
}
