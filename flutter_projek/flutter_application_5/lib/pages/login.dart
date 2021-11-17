import 'package:flutter/material.dart';
import 'package:flutter_application_4/pages/home.dart';
import 'package:flutter_application_4/widgets/menu.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      drawer: MenuWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                width: 64,
                height: 64,
                child: Image.asset('images/logo.png'),
              ),
              Center(child: Text('Fruit App')),
              SizedBox(height: 50),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                padding: EdgeInsets.symmetric(vertical: 5),
                //color: Colors.green[100],
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Sila masukkan ID Pengguna';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Masukkan ID Pengguna",
                    labelStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                    hintText: "No K/P tanpa '-'",
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                padding: EdgeInsets.symmetric(vertical: 5),
                //color: Colors.green,
                child: TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Sila masukkan kata laluan';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Masukkan Kata Laluan",
                    labelStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                    hintText: "Seperti yang di daftarkan",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        primary: Colors.red),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Login Berjaya')),
                        );

                        //function proses input hantar ke API
                        //Jika berjaya
                        //Navigator
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      }
                    },
                    child: Text('Login')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
