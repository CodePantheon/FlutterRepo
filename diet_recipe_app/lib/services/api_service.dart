import 'dart:convert';
import 'dart:io';
import 'package:diet_recipe_app/models/recipe_model.dart';
import 'package:http/http.dart' as http;
import 'package:diet_recipe_app/models/meal_plan_model.dart';

class APIService
{
  static const String _baseUrl = "api.spoonacular.com";
  static const String API_KEY = "47adafb5c3404151a5f685e0f976b1a3";

  static final APIService instance = APIService._instantiate();

  APIService._instantiate();

  Future<MealPlan> generateMealPlan({int targetCalories, String diet}) async{
    if(diet == "none") {
      diet = "";
    }

    Map<String, String> parameters = {
      "timeFrame" : "day",
      "targetCalories" : targetCalories.toString(),
      "diet" : "diet",
      "apiKey" : API_KEY
    };

    Uri uri = Uri.https(_baseUrl, "/recipes/mealplans/generate", parameters);

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader : "application/json"
    };

    try {
      var response = await http.get(uri, headers: headers);
      Map<String, dynamic> data = json.decode(response.body);
      MealPlan mealPlan = MealPlan.fromMap(data);
      return mealPlan;
    } catch(e) {
      throw e.toString();
    }
  }

  Future<Recipe> fetchRecipe(String id) async{
    Map<String, String> parameters = {
      "includeNutrition" : "false",
      "apiKey" : API_KEY
    };

    Uri uri = Uri.https(_baseUrl, "/recipes/$id/information", parameters);

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader : "application/json"
    };

    try {
      var response = await http.get(uri, headers: headers);
      Map<String, dynamic> data = json.decode(response.body);
      Recipe recipe = Recipe.fromMap(data);
      return recipe;
    } catch(e) {
      throw e.toString();
    }
  }
}