![flutter](screen.jpg)

- Pengenalan kepada Mobile Platorm
- Apa itu Flutter Framework
- Pemasangan persekitaran Flutter, Android SDK & VSCode IDE
- Widget Layout & UI Element

## Latihan 1

Menghasilkan projek flutter dengan penerangan kerangka asas Flutter

- StatelessWidget
- MaterialApp
- Scaffold

### StatelessWidget
```dart
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
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
```

### StatefulWidget
```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
```

Latihan 1 : [flutter_application_1](https://github.com/mzm-dev/upskill-flutter/tree/main/flutter_projek/flutter_application_1)

## Latihan 2

Merangka Layout berasaskan **Column** dan **Row** bagi membentuk satu susunan _layout_ yang dikehendaki didalam antaramuka aplikasi

![flutter layout](screen-layout.png)

- StatelessWidget
- MaterialApp
- Scaffold
- Widget Column and children
- Widget Row and children
- Widget Container and child   


Latihan 2 : [flutter_application_2](https://github.com/mzm-dev/upskill-flutter/tree/main/flutter_projek/flutter_application_2)


## Latihan 3
Melengkapkan Layout **Column** dan **Row** dengan kandungan seperti Widget Text & Image untuk menghasilkan aplikasi lebih menarik

![flutter apps](screen-apps.png)

Mewujudkan fail ```home.dart``` yang berasingan bagi penyusunan struktur projek 

- Widget Column and children
- Widget Row and children
- Widget Container and child 
  - Widget Center
  - Widget Text
  - Widget Image  
  - Dependencies : images
- Navigator push and pop

**double? width**
```MediaQuery.of(context).size.width``` 

**double? height**
```MediaQuery.of(context).size.height```


  
Latihan 4 : [flutter_application_3](https://github.com/mzm-dev/upskill-flutter/tree/main/flutter_projek/flutter_application_4)

## Latihan 4

Mewujudkan fail ```show.dart``` untu memaparkan butiran dari ```home.dart```
- Dependencies : fonts
  - ```fontFamily: 'Bubblegum'```
- Navigator push and pop
  - Widget InkWell  
- Data Model
- ListView Builder
- UI Element ```ListTile()```

**Custom Widget : KlikGambarWidget()**
```dart
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
```
**Data Models**

```dart
class Gambar {
  String gambar;
  String tajuk;

  Gambar({required this.gambar, required this.tajuk});
}
```

**Data List<Gambat>**
```dart
List<Gambar> semua = [
  Gambar(gambar: 'avatar/avatar1.png', tajuk: 'Avatar 1'),
  Gambar(gambar: 'avatar/avatar2.png', tajuk: 'Avatar 2'),
  Gambar(gambar: 'avatar/avatar3.png', tajuk: 'Avatar 3'),
  Gambar(gambar: 'avatar/avatar4.png', tajuk: 'Avatar 4'),
  Gambar(gambar: 'avatar/avatar5.png', tajuk: 'Avatar 5'),
];

```

  
Latihan 4 : [flutter_application_4](https://github.com/mzm-dev/upskill-flutter/tree/main/flutter_projek/flutter_application_4)

# Rujukan
- https://flutterflow.io/index.html
