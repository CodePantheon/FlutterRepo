class Meal {
  static const Map<int, String> mealTypes = {
    0: "Breakfast",
    1: "Lunch",
    2: "Dinner"
  };

  String _mealType;
  final int id;
  final String title;
  final String imageUrl;

  Meal({this.id, this.title, this.imageUrl});

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
        id: map["id"],
        title: map["title"],
        imageUrl: "https://spoonacular.com/recipeImages/" + map["image"]);
  }

  String get mealType => _mealType;

  void setMealType(int mealTypeIndex) {
    _mealType = mealTypes.containsKey(mealTypeIndex)
        ? mealTypes[mealTypeIndex]
        : mealTypes[0];
  }
}
