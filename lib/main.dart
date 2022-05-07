// import 'dart:math';
import 'package:flutter/material.dart';
import 'models/settings.dart';
import 'screens/meal_details_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'utils/app_routes.dart';

import 'screens/tabs_screen.dart';
import 'models/meal.dart';
import 'data/dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final tema = ThemeData(fontFamily: 'Raleway');

  Settings settings = Settings();

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegan && !meal.isVegan;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar',
      routes: {
        AppRoutes.HOME: (context) => const TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (context) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (context) => const MealDetail(),
        AppRoutes.SETTINGS: (context) => SettingsScreen(_filterMeals, settings),
      },
      theme: tema.copyWith(
          colorScheme: tema.colorScheme.copyWith(
            primary: Colors.indigo[400],
            secondary: Colors.amber[400],
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
