// recipe_detail.dart
import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailPage({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(recipe.imageUrl),
            SizedBox(height: 16.0),
            Text(
              recipe.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              "Ingredients:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            for (var ingredient in recipe.ingredients)
              Text('- $ingredient'),
            SizedBox(height: 16.0),
            Text(
              "Instructions:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            for (var instruction in recipe.instructions)
              Text('- $instruction'),
            SizedBox(height: 16.0),
            if (recipe.variations != null)
              ...[
                Text(
                  "Variations:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ...recipe.variations!.map((variation) => ListTile(
                      title: Text(variation.title),
                      subtitle: Text(variation.description),
                      leading: Image.network(
                        variation.imageUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RecipeDetailPage(recipe: variation),
                          ),
                        );
                      },
                    )),
              ]
          ],
        ),
      ),
    );
  }
}
