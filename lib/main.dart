import 'dart:math';
import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final tema = ThemeData(fontFamily: 'Raleway');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar',
      theme: tema.copyWith(
          colorScheme: tema.colorScheme.copyWith(
            primary: Colors.pink,
            secondary: Colors.amber,
          ),
          textTheme: tema.textTheme.copyWith(
            headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                color: Colors.black),
          ),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1)),
      home: CategoriesScreen(
        key: ValueKey(Random().nextInt(100)),
      ),
    );
  }
}
