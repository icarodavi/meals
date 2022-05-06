import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  final List<String> _titles = const ['Lista de Categorias', 'Meus Favoritos'];

  final List<Widget> _screens = const [CategoriesScreen(), FavoriteScreen()];

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
