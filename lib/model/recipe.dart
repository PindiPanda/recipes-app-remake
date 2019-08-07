import 'package:duration/duration.dart';

enum RecipeType{
  food,
  dessert,
  drink,
}

class Recipe {
  final String id;
  final RecipeType type;
  final String name;
  final String servings;
  final Duration duration;
  final List<String> ingredients;
  final List<String> preparation;
  final List<String> notes;
  final String imageURL;

  const Recipe({
    this.id,
    this.type,
    this.name,
    this.servings,
    this.duration,
    this.ingredients,
    this.preparation,
    this.notes,
    this.imageURL,
  });

  String get getDurationString => prettyDuration(this.duration);
}