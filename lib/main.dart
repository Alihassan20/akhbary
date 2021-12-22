
import 'dart:io';

import 'package:flutter/material.dart';

import 'feature/screen/animation_splash.dart';
import 'feature/screen/details.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global =  MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'ArefRuqaa',
        textTheme: ThemeData.light().textTheme.copyWith(
            headline5: const TextStyle(
                color: Colors.white,
              fontSize: 30,
                fontFamily: 'ArefRuqaa',
                fontWeight: FontWeight.bold)),
      ),
      routes: {
        DetailsScreen.routName: (context) => const DetailsScreen(),
      },
      home: SplashScreen(),
    );
  }
}
