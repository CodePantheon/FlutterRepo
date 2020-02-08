import 'package:diet_recipe_app/models/meal_model.dart';
import 'package:diet_recipe_app/models/meal_plan_model.dart';
import 'package:diet_recipe_app/models/recipe_model.dart';
import 'package:diet_recipe_app/presenter/diet_recipe_presenter.dart';
import 'package:diet_recipe_app/screens/recipe_screen.dart';
import 'package:flutter/material.dart';

class MealsScreen extends StatefulWidget {
  final DietRecipePresenter _dietRecipePresenter = DietRecipePresenter();
  final MealPlan mealPlan;

  MealsScreen({this.mealPlan});

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Meal Plan"),
      ),
      body: ListView.builder(
          itemCount: widget.mealPlan.meals.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return _buildTotalNutrientsCard();
            } else {
              Meal meal = widget.mealPlan.meals[index - 1];
              meal.setMealType(index - 1);
              return _buildMealCard(meal);
            }
          }),
    );
  }

  Widget _buildTotalNutrientsCard() {
    return Container(
      height: 140.0,
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Total Nutrients",
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Calories: ${widget.mealPlan.calories} cal",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
              Text(
                "Protien: ${widget.mealPlan.protein} g",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Fat: ${widget.mealPlan.fat} g",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
              Text(
                "Carbs: ${widget.mealPlan.carbs} g",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMealCard(Meal meal) {
    return GestureDetector(
      onTap:() => _fetchRecipe(meal),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: 220.0,
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
                image: DecorationImage(
                    image: NetworkImage(meal.imageUrl), fit: BoxFit.cover)),
          ),
          Container(
            margin: EdgeInsets.all(60.0),
            padding: EdgeInsets.all(10.0),
            color: Colors.white70,
            child: Column(
              children: <Widget>[
                Text(
                  meal.mealType,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                Text(
                  meal.title,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _fetchRecipe(Meal meal) async {
    Recipe recipe = await widget._dietRecipePresenter.fetchRecipe(meal.id);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RecipeScreen(meal.mealType, recipe),
      ),
    );
  }
}
