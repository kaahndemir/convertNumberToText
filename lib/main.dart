import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:number_converter_desktop/number_to_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
String result = '...';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 26, 26, 26),
      body: Center(
          child: ListView(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width /100*40,
                  child: TextField(
                    maxLength: 99,
                    maxLines: null,
                    onChanged: (e){
                      setState(() {
                        result = ConvertNumber(input.text);
                      });
                    },
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                      TextInputFormatter.withFunction((oldValue, newValue) {
                        try {
                          final text = newValue.text;
                          if (text.isNotEmpty) double.parse(text);
                          return newValue;
                        } catch (e) {}
                        return oldValue;
                      }),
                    ],
                    controller: input,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Sayı giriniz',
                      hintStyle: primary,
                      
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(result, style: h1,))
              ],
            ),
        ),
    );
  }
}