import 'package:flutter/material.dart';

class ShowPage extends StatelessWidget {
  ShowPage({Key? key, required this.gambar, required this.title})
      : super(key: key);

  final String gambar;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/$gambar'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
