// main.dart
import 'package:flutter/material.dart';
import 'package:recipe/recipe.dart';
import 'package:recipe/recipe_detail.dart';

void main() {
  runApp(RecipeApp());
}



class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecipeListPage(),
    );
  }
}

class RecipeListPage extends StatefulWidget {
  @override
  _RecipeListPageState createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  final List<Recipe> recipes = [
    Recipe(
      title: 'Pasta',
      description: 'Al dente, saucy',
      ingredients: [
        '1 pound pasta',
        '1 jar pasta sauce',
        '1/2 cup grated Parmesan cheese',
        'Optional toppings: cooked meat, vegetables, red pepper flakes'
      ],
      instructions: [
        'Cook pasta according to package directions. Drain and set aside.',
        'In a skillet, heat olive oil. Add toppings, sauté.',
        'Add sauce, then pasta, and mix. Serve with Parmesan cheese.'
      ],
      imageUrl:
          'https://tse3.mm.bing.net/th?id=OIP.wSuyQCcpGi9Zo9G_IgWiRAHaGw&pid=Api&P=0&h=180',
      variations: [
        Recipe(
          title: 'Spaghetti',
          description: 'Classic spaghetti pasta.',
          ingredients: [
            '1 pound spaghetti',
            '1 pound ground beef',
            '1/2 cup breadcrumbs',
            '1/4 cup grated Parmesan cheese',
            '1 egg',
            '1/4 cup chopped onion',
            '1/4 cup chopped garlic',
            '1 can (28 ounces) crushed tomatoes',
            '1 teaspoon dried oregano',
            '1/2 teaspoon dried basil'
          ],
          instructions: [
            'Cook spaghetti according to package directions.',
            'Combine beef, breadcrumbs, cheese, egg, onion, garlic. Form into meatballs.',
            'Cook meatballs in skillet. Add tomatoes and spices, simmer.',
            'Mix with pasta. Serve with Parmesan.'
          ],
          imageUrl:
              'https://th.bing.com/th/id/OIP.AX3eF50qIH9YKzMZT0Zo0wHaE6?rs=1&pid=ImgDetMain',
        ),
      ],
    ),
    // Add more recipes here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe List'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return ListTile(
            title: Text(recipe.title),
            subtitle: Text(recipe.description),
            leading: Image.network(
              recipe.imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailPage(recipe: recipe),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
