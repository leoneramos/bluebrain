import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:docdoctes/screens/LoginScreen.dart';

Future<void> main() async {
  const apiKey = 'emac7v6qqt6p';
  const userToken =
      'yphsdtvsa9rqq5py87apef25nrc454cruhtc7r6ayz6tc6vppzzqk9tjqyhwj2ac';

  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  runApp(MyApp());

  await Parse().initialize(
    'UPQGEaOjSSqDB835QhIAlbw9QTZh4A2UcxctZdLE',
    'https://parseapi.back4app.com/',
    clientKey: 'ON3ZlPKcBM9XsarcroFfezKViQCSr1J2wTIjuvqv',
    autoSendSessionId: true,
    debug: true,
  );
}

Future<void> initializeParse() async {
  await Parse().initialize(
    'UPQGEaOjSSqDB835QhIAlbw9QTZh4A2UcxctZdLE',
    'https://parseapi.back4app.com/',
    clientKey: 'ON3ZlPKcBM9XsarcroFfezKViQCSr1J2wTIjuvqv',
    autoSendSessionId: true,
    debug: true,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bem vindo ao Blue Brain',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Bem Vindo ao Blue Brain'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 3,
        gradientBackground: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.lightBlue, Colors.lightBlueAccent]),
        navigateAfterSeconds: LoginScreen(),
        loaderColor: Colors.transparent,
      ),
      Container(
        padding: EdgeInsets.all(15),
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            'imagens/logo.png',
          ),
          fit: BoxFit.none,
        )),
      ),
    ],
  );
}
