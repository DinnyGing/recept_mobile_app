class Meal {
  final int id;
  final String title, imgURL;

  Meal({required this.id, required this.title, required this.imgURL });

  factory Meal.fromMap(Map<String, dynamic> map) {
    //Meal object
    return Meal(
      id: map['id'],
      title: map['title'],
      imgURL: 'https://spoonacular.com/recipeImages/' + map['id'].toString() + '-556x370.jpg',
    );
  }
}