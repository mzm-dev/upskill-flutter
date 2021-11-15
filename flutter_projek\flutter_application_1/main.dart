import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              child: Image.asset('images/jata.png'),
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                width: 200,
                color: Colors.yellow[100],
                padding: EdgeInsets.all(12),
                child: const Text(
                  'Hello World',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                child: Text('Hello flutter'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
