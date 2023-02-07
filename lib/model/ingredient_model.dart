class Ingredient{
  final int id;
  final String title, img;
  final double amount;

  Ingredient({required this.id, required this.title, required this.img, required this.amount});

  factory Ingredient.fromMap(Map<String, dynamic> map) {
    //Meal object
    return Ingredient(
      id: map['id'],
      title: map['name'],
      img: "https://spoonacular.com/cdn/ingredients_100x100/" + map['image'],
      amount: map['amount'],
    );
  }
}