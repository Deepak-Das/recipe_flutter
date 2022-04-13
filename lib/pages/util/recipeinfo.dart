import 'dart:convert' as convert;

import 'package:http/http.dart';
import 'package:recipe_flutter/Model/RecipeModel.dart';

class RecipeInfo {
  late List<RecipeModel> recipeList= <RecipeModel>[];

  Future<void> getRecips(String foodName) async {
    String a =
        "https://api.spoonacular.com/recipes/complexSearch?query=$foodName&apiKey=3accc771d80c4f03a0c2c39151562701";

    var url = Uri.parse(a);
    print("url $url");
    Response response = await get(url);

    Map<String, dynamic> jsdata = convert.jsonDecode(response.body);
    jsdata['results'].forEach((value){

      RecipeModel recipeModel=new RecipeModel.fromMap(value);
      recipeList.add(recipeModel);
      

    });

    // return recipeList;
    //
    // recipeList.forEach((element) {
    // print("image url : ${element.imageUrl}");
    // });
  }
}
