import 'package:flutter/material.dart';
import 'package:flutter_application_4/pages/show.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('images/fruit/fruit_1.jpg'),
            ),
            title: Text('Fruit 1'),
            subtitle: Text('Fruit Color'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowPage(
                          gambar: 'fruit/fruit_1.jpg', title: 'Fruit 1')));
            },
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('images/fruit/fruit_2.jpg'),
            ),
            title: Text('Fruit 1'),
            subtitle: Text('Fruit Color'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowPage(
                          gambar: 'fruit/fruit_1.jpg', title: 'Fruit 1')));
            },
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('images/fruit/fruit_2.jpg'),
            ),
            title: Text('Fruit 2'),
            subtitle: Text('Fruit Color'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowPage(
                          gambar: 'fruit/fruit/fruit_2.jpg',
                          title: 'Fruit 2')));
            },
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('images/fruit/fruit_3.jpg'),
            ),
            title: Text('Fruit 3'),
            subtitle: Text('Fruit Color'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowPage(
                          gambar: 'fruit/fruit_3.jpg', title: 'Fruit 3')));
            },
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('images/fruit/fruit_4.jpg'),
            ),
            title: Text('Fruit 4'),
            subtitle: Text('Fruit Color'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowPage(
                          gambar: 'fruit/fruit_4.jpg', title: 'Fruit 4')));
            },
          ),
          ListAvatarWidget(gambar: 'avatar/avatar1.png', tajuk: 'Avatar 1'),
          ListAvatarWidget(gambar: 'avatar/avatar2.png', tajuk: 'Avatar 2'),
          ListAvatarWidget(gambar: 'avatar/avatar3.png', tajuk: 'Avatar 3'),
          ListAvatarWidget(gambar: 'avatar/avatar4.png', tajuk: 'Avatar 4'),
          ListAvatarWidget(gambar: 'avatar/avatar5.png', tajuk: 'Avatar 5'),
          ListAvatarWidget(gambar: 'avatar/user1.jpg', tajuk: 'User 1'),
          ListAvatarWidget(gambar: 'avatar/user2.jpg', tajuk: 'User 2'),
          ListAvatarWidget(gambar: 'avatar/user3.jpg', tajuk: 'User 3'),
          ListAvatarWidget(gambar: 'avatar/user4.jpg', tajuk: 'User 4'),
          ListAvatarWidget(gambar: 'avatar/user5.jpg', tajuk: 'User 5'),
          ListAvatarWidget(gambar: 'avatar/user6.jpg', tajuk: 'User 6'),
          ListAvatarWidget(gambar: 'avatar/user7.jpg', tajuk: 'User 7'),
          ListAvatarWidget(gambar: 'avatar/user8.jpg', tajuk: 'User 8'),
        ],
      ),
    );
  }
}

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
