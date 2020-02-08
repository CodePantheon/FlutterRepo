import 'package:diet_recipe_app/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeScreen extends StatelessWidget {
  final String mealType;
  final Recipe recipe;

  RecipeScreen(this.mealType, this.recipe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mealType),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: recipe.spoonacularSourceUrl,
      ),
    );
  }
}

