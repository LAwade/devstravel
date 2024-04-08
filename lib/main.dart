import 'package:devstravel/src/models/appdata.dart';
import 'package:devstravel/src/pages/cities.dart';
import 'package:devstravel/src/pages/continent.dart';
import 'package:devstravel/src/pages/home.dart';
import 'package:devstravel/src/pages/preload.dart';
import 'package:devstravel/src/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AppData(),
          ),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/preload',
      routes: {
        '/home': (context) => HomePage(),
        '/preload': (context) => PreloadPage(),
        '/search': (context) => SearchPage(),
        '/continente': (context) => ContinentePage(),
        '/cities': (context) => Cities(),
      },
    );
  }
}
