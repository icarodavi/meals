import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';
import 'package:meals/components/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(this.favoriteMeals, {Key? key}) : super(key: key);

  final List<Meal> favoriteMeals;
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  final List<String> _titles = const ['Lista de Categorias', 'Meus Favoritos'];
  late List<Widget> _screens;

  @override
  initState() {
    super.initState();
    _screens = [const CategoriesScreen(), FavoriteScreen(widget.favoriteMeals)];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_titles[_selectedScreenIndex]),
          ],
        ),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex],
      // body: const TabBarView(children: [
      //   CategoriesScreen(),
      //   FavoriteScreen(),
      // ]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedScreenIndex,
          backgroundColor: Theme.of(context).colorScheme.primary,
          iconSize: 30,
          onTap: _selectScreen,
          unselectedItemColor: Theme.of(context).colorScheme.inversePrimary,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categorias',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favoritos',
            )
          ]),
    );
  }
}
