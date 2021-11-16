import 'package:flutter/material.dart';
import 'package:flutter_application_4/pages/show.dart';

class ListAvatarWidget extends StatelessWidget {
  ListAvatarWidget({Key? key, required this.gambar, required this.tajuk})
      : super(key: key);

  String gambar;
  String tajuk;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage('images/$gambar'),
      ),
      title: Text('$tajuk 1'),
      subtitle: Text('$tajuk Color'),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShowPage(gambar: gambar, title: tajuk)));
      },
    );
  }
}
