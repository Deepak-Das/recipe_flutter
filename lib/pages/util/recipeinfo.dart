import 'dart:convert' as convert;

import 'package:http/http.dart';
import 'package:recipe_flutter/Model/RecipeModel.dart';
import 'package:recipe_flutter/Model/recipeDetail.dart';

class RecipeInfo {
  var _api_key="3accc771d80c4f03a0c2c39151562701";
  late List<RecipeModel> recipeList = <RecipeModel>[];

  Future<void> getRecips(String foodName) async {
    String recipeUrl =
        "https://api.spoonacular.com/recipes/complexSearch?query=$foodName&apiKey=$_api_key";

    var url = Uri.parse(recipeUrl);
    print("url $url");
    Response response = await get(url);

    Map<String, dynamic> jsdata = convert.jsonDecode(response.body);
    jsdata['results'].forEach((value) {
      RecipeModel recipeModel = new RecipeModel.fromMap(value);
      recipeList.add(recipeModel);
    });
  }
  
  Future<RecipeDetail> getDetail(var id) async {
    var infoUrl="https://api.spoonacular.com/recipes/$id/information?includeNutrition=false&apiKey=$_api_key";
    var uri=Uri.parse(infoUrl);

    Response response= await get(uri);
    var jsdata=convert.jsonDecode(response.body);
    RecipeDetail recipeDetail=RecipeDetail.fromMap(jsdata);
    return recipeDetail;

  }
  
}
