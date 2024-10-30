
class Recipe {
  final String title;
  final String description;
  final List<String> ingredients;
  final List<String> instructions;
  final String imageUrl;
  final List<Recipe>? variations;

  Recipe({
    required this.title,
    required this.description,
    required this.ingredients,
    required this.instructions,
    required this.imageUrl,
    this.variations,
  });
}
