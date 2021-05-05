import 'package:flutter/material.dart';
import 'package:halyk_fund/screens/auth/LoginPage.dart';
import 'package:halyk_fund/screens/auth/SignupPage.dart';
import 'screens/HomePage.dart';
import 'splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: SplashPage(),
        routes: <String, WidgetBuilder>{
          '/login': (BuildContext context) => LoginPage(),
          '/register': (BuildContext context) => SignupPage(),
        });
  }
}
