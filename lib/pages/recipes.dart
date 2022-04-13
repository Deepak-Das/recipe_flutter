import 'package:flutter/material.dart';
import 'package:recipe_flutter/pages/util/cardView.dart';
import 'package:recipe_flutter/pages/util/title.dart';

import '../Model/RecipeModel.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  late Map data = {};
  late List<RecipeModel> list;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map;
    list = data['list'];
    list.forEach((element) {
      print(element.title);
    });
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: CustomeTitle(title: "List of Recipes"),
          centerTitle: true,
          elevation: 0.0),
      body: SingleChildScrollView(
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 8.0, // gap between adjacent chips
          runSpacing: 4.0,
          children: [
            Column(
              children: list.map((e) => CardView(recipeModel: e)).toList(),
            )
          ],
        ),
      ),
    );
  }
}
