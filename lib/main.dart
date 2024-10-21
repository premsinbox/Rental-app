import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_screen/homescreen.dart';
import 'package:sample_screen/model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NavigationModel(),
      child: TravelApp(),
    ),
  );
}

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontFamily: 'BeVietnamPro'),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

