import 'package:flutter/material.dart';
import 'package:flutter_application_4/pages/show.dart';
import 'package:flutter_application_4/widgets/listavatar.dart';
import 'package:flutter_application_4/widgets/menu.dart';

//Model
class Gambar {
  String gambar;
  String tajuk;

  Gambar({required this.gambar, required this.tajuk});
}

List<Gambar> semua = [
  Gambar(gambar: 'avatar/avatar1.png', tajuk: 'Avatar 1'),
  Gambar(gambar: 'avatar/avatar2.png', tajuk: 'Avatar 2'),
  Gambar(gambar: 'avatar/avatar3.png', tajuk: 'Avatar 3'),
  Gambar(gambar: 'avatar/avatar4.png', tajuk: 'Avatar 4'),
  Gambar(gambar: 'avatar/avatar5.png', tajuk: 'Avatar 5'),
];

class ListDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      drawer: MenuWidget(),
      body: ListView.builder(
        itemCount: semua.length,
        itemBuilder: (context, index) {
          return ListAvatarWidget(
            gambar: semua[index].gambar,
            tajuk: semua[index].tajuk,
          );
        },
      ),
    );
  }
}
