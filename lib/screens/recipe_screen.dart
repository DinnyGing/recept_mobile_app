import 'package:flutter/material.dart';
import 'package:recept/model/ingredient_model.dart';
import 'package:recept/model/recipe_model.dart';
import 'package:recept/screens/instruction_screen.dart';
import 'package:recept/services/api_services.dart';


class RecipeScreen extends StatefulWidget{
  final Recipe recipe;
  final String mealType;

  RecipeScreen({required this.recipe, required this.mealType});
  @override
  _RecipeScreenState createState() => _RecipeScreenState();

}
class _RecipeScreenState extends State<RecipeScreen>{
  @override
  void _getInstruction() async{
    Navigator.push(context, MaterialPageRoute(
      builder: (_) => Instruction(title: widget.recipe.title, instruction: widget.recipe.instruction,),
    ));
  }


  _buildTotalInfoCard() {
    return Container(
      height: 520,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 2), blurRadius: 6)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Total Information',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Title: ${widget.recipe.title.toString()}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Ready in minutes: ${widget.recipe.readyInMinutes.toString()} min',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Servings: ${widget.recipe.servings.toString()}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Image(
            image: NetworkImage(widget.recipe.image),
          ),
          SizedBox(height: 10,),
          TextButton(
              onPressed: _getInstruction,
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                primary: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(
                      color: Colors.grey,
                      width: 1,
                      style: BorderStyle.solid
                  ),
                ),
              ),
              child: Text(
                "Instruction"
              )
          ),
          SizedBox(height: 10,),
          Text(
            "Ingredients:",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5
            ),
          )
        ],
      ),
    );
  }


  _buildIngredientCard(Ingredient ingredient, int index) {
    return
      Container(
        child:
        Column(
            children: <Widget>[
              //First widget is a container that loads decoration image
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(5),
                color: Colors.white70,
                child: Column(
                  children: <Widget>[
                    Text(
                      " - " + ingredient.amount.toInt().toString() + " " + ingredient.title,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Image(
                        image: NetworkImage(ingredient.img),
                    )
                  ],
                ),
              )
            ]
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mealType),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
          itemCount: 1 + widget.recipe.ingredients.length,
          itemBuilder: (BuildContext contex, int index){
            if(index == 0){
              return _buildTotalInfoCard();
            }

            Ingredient ingredient = widget.recipe.ingredients[index - 1];
            return _buildIngredientCard(ingredient, index - 1);
          }
      ),

    );
  }
}