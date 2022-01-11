import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:number_converter_desktop/number_to_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

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
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
        ),
        home: Home());
  }
}

final input = TextEditingController();
final primary =
    TextStyle(color: Colors.white, fontSize: 40, fontFamily: 'Radyo');
final h1 = TextStyle(color: Colors.white, fontSize: 40, fontFamily: 'Raleway');
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
    double width = MediaQuery.of(context).size.width;
    double rateWidth = width/100;
    print(width);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 26, 26, 26),
      body: Center(
          child: Container(
        alignment: Alignment.topCenter,
        width: (width < 992)? rateWidth * 80: rateWidth *40,
        margin:
            EdgeInsets.only(top: MediaQuery.of(context).size.height / 100 * 20),
        child: SingleChildScrollView(
          physics: RangeMaintainingScrollPhysics(
            
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                maxLength: 102,
                maxLines: null,
                onChanged: (e) {
                  setState(() {
                    if(input.text.isNotEmpty){
                      result = ConvertNumber(input.text);
                    } else{
                      result = '...';
                    }
                  });
                },
                style: primary,
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
              SelectableText(
                result,
                style: h1,
              ),
              
            ],
          ),
        ),
      )),
    );
  }
}

Future<void> _launchInBrowser(String url) async {
  if (!await launch(
    url,
    forceSafariVC: false,
    forceWebView: false,
    headers: <String, String>{'my_header_key': 'my_header_value'},
  )) {
    throw 'Could not launch $url';
  }
}
/* */