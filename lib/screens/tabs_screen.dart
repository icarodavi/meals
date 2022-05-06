import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Vamos Cozinhar?'),
            ],
          ),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.category),
              text: 'Categorias',
            ),
            Tab(
              icon: Icon(Icons.favorite),
              text: 'Favoritos',
            ),
          ]),
        ),
        body: const TabBarView(children: [
          CategoriesScreen(),
          FavoriteScreen(),
        ]),
      ),
    );
  }
}
