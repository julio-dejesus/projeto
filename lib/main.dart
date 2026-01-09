import 'package:flutter/material.dart';
import 'package:projeto1_curso/pages/details_page.dart';
import 'package:projeto1_curso/pages/home_page.dart';
import 'package:projeto1_curso/pages/login_page.dart';
import 'package:projeto1_curso/pages/splash_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Projeto",
      theme: ThemeData(
        primaryColor: Colors.green
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => SplashPage(),
        '/login': (_) => LoginPage(),
        '/home': (_) => HomePage(),
        '/details': (_) => DetailsPage(),
      },
    );
  }
}

