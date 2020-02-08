import 'package:diet_recipe_app/models/meal_plan_model.dart';
import 'package:diet_recipe_app/models/recipe_model.dart';
import 'package:diet_recipe_app/services/api_service.dart';

class DietRecipePresenter
{
  Future<MealPlan> getMealPlan({int targetCalories, String diet}) async{
    var mealPlan = await APIService.instance.generateMealPlan(targetCalories: targetCalories, diet: diet);
    return mealPlan;
  }

  Future<Recipe> fetchRecipe(int mealId) async{
    var recipe = await APIService.instance.fetchRecipe(mealId.toString());
    return recipe;
  }
}