import 'dart:math';
import 'package:flutter/material.dart';
import 'package:meals/screens/meal_details_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'utils/app_routes.dart';

import 'screens/tabs_screen.dart';

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
      routes: {
        AppRoutes.HOME: (context) => TabsScreen(
              key: ValueKey(Random().nextInt(100)),
            ),
        AppRoutes.CATEGORIES_MEALS: (context) => CategoriesMealsScreen(
              key: ValueKey(Random().nextInt(100)),
            ),
        AppRoutes.MEAL_DETAIL: (context) => MealDetail(
              key: ValueKey(Random().nextInt(100)),
            )
      },
      theme: tema.copyWith(
          colorScheme: tema.colorScheme.copyWith(
            primary: Colors.indigo[400],
            secondary: Colors.amber,
          ),
          textTheme: tema.textTheme.copyWith(
            headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                color: Colors.black),
          ),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1)),
    );
  }
}
