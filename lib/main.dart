import 'package:flutter/material.dart';
import 'package:recipe_flutter/pages/Detail.dart';
import 'package:recipe_flutter/pages/home.dart';
import 'package:recipe_flutter/pages/recipes.dart';


void main() {
  runApp( MaterialApp(
    initialRoute: "/detail",
    routes: {
      '/' : (context)=> Home(),
      '/recipes' : (context)=>  RecipesScreen(),
      '/detail': (context)=>  Detail()

    },
  ));
}

