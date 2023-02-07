
import 'package:recept/model/ingredient_model.dart';

class Recipe{
  List<Ingredient> ingredients;
  String title, image, instruction;
  int readyInMinutes, servings;

  Recipe({required this.ingredients,required this.title,required this.image,required this.readyInMinutes,
     required this.servings, required this.instruction});

  factory Recipe.fromMap(Map<String, dynamic> map){
    List<Ingredient> ingredients = [];
    map['extendedIngredients'].forEach((mealMap) => ingredients.add(Ingredient.fromMap(mealMap)));
    return Recipe(
      ingredients: ingredients,
      title: map['title'],
      image: map['image'],
      readyInMinutes: map['readyInMinutes'],
      servings: map['servings'],
      instruction: map['instructions'],
    );
  }
}