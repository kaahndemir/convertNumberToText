import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final newTextTheme = Theme.of(context).textTheme.apply(
    bodyColor: Colors.pink,
    displayColor: Colors.pink,
    );
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white)
        ),
        
      ),
      home: Home()
    );
  }
}

final input = TextEditingController();
final primary = TextStyle(color: Colors.white);
final h1 = TextStyle(color: Colors.white, fontSize: 20);

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 26, 26, 26),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: input,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Sayı giriniz',
                  hintStyle: primary,
                  
                ),
              ),
              FlatButton(
                minWidth: MediaQuery.of(context).size.width /100*40,
                color: Colors.white,
                onPressed: (){
                }, 
              child: Text('Çevir')),
              Container(
                padding: EdgeInsets.all(10),
                child: Text('Result', style: h1,))
            ],
          ),
        ),
    );
  }
}