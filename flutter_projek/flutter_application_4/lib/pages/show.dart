import 'package:flutter/material.dart';

class ShowPage extends StatelessWidget {
  ShowPage({Key? key, required this.gambar}) : super(key: key);

  final String gambar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Show')),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/fruit/$gambar'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
