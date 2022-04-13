class RecipeDetail {
  String title;
  String vegetarian;
  String vegan;
  String glutenFree;
  String dairyFree;
  String summary;
  String imageUrl;

  RecipeDetail(
      {required this.title,
      required this.imageUrl,
      required this.vegetarian,
      required this.vegan,
      required this.glutenFree,
      required this.dairyFree,
      required this.summary});

  factory RecipeDetail.fromMap(Map<String, dynamic> parsedJson) {
    return RecipeDetail(
        title: parsedJson["title"],
        imageUrl: parsedJson["image"],
        vegetarian: parsedJson["vegetarian"] ? 'Yes' : 'NO',
        vegan: parsedJson["vegan"] ? 'Yes' : 'NO',
        glutenFree: parsedJson["glutenFree"] ? 'Yes' : 'NO',
        dairyFree: parsedJson["dairyFree"] ? 'Yes' : 'NO',
        summary: parsedJson["summary"]);
  }
}
