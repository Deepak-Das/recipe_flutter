class RecipeModel {
  final int id;
  final String title;
  final String imageUrl;

  RecipeModel({required this.id, required this.title, required this.imageUrl});

  factory RecipeModel.fromMap(Map<String,dynamic> parsedJson){
    return RecipeModel(id: parsedJson["id"], title: parsedJson["title"], imageUrl: parsedJson["image"]);
  }


}