import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetail extends StatelessWidget {
  const MealDetail(this.favoriteMeal, this.isMealFavorite, {Key? key})
      : super(key: key);
  final void Function(Meal) favoriteMeal;
  final bool Function(Meal) isMealFavorite;
  _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget _createSectionContainer(BuildContext context, Widget child) {
    return Container(
      width: 300,
      height: 200,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          _createSectionTitle(context, 'Ingredientes'),
          _createSectionContainer(
            context,
            ListView.builder(
              itemCount: meal.ingredients.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(meal.ingredients[index]),
                  ),
                  color: Theme.of(context).colorScheme.secondary,
                );
              },
            ),
          ),
          _createSectionTitle(context, 'Passos'),
          _createSectionContainer(
            context,
            ListView.builder(
              itemCount: meal.steps.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      title: Text(meal.steps[index]),
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: isMealFavorite(meal)
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border_outlined),
        onPressed: () {
          favoriteMeal(meal);
        },
      ),
    );
  }
}
