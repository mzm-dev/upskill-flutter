import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Home(),
    );
  }
}

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
            height: 150,
            color: Colors.green,
            child: Center(child: Text('Column 1')),
          ),
          Container(
            padding: EdgeInsets.all(5),
            height: 80,
            color: Colors.orange,
            child: Text('Column 2'),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: Text('Column 3'),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.25,
                  color: Colors.purple[100],
                  child: Center(child: Text('Row 1')),
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.25,
                  color: Colors.purple[200],
                  child: Center(child: Text('Row 2')),
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.25,
                  color: Colors.purple[300],
                  child: Center(child: Text('Row 3')),
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.25,
                  color: Colors.purple[400],
                  child: Center(child: Text('Row 4')),
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
                  color: Colors.teal[400],
                  child: Center(child: Text('Row 1')),
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.75,
                  color: Colors.teal[200],
                  child: Center(child: Text('Row 2')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
