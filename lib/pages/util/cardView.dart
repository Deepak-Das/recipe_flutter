import 'package:flutter/material.dart';
import 'package:recipe_flutter/Model/RecipeModel.dart';
import 'package:recipe_flutter/Model/recipeDetail.dart';
import 'package:recipe_flutter/pages/util/recipeinfo.dart';

class CardView extends StatelessWidget {
  late RecipeModel recipeModel;
  late RecipeDetail recipeDetail;

  CardView({required this.recipeModel});

  void route(int id, BuildContext context) async {
    await RecipeInfo().getDetail(id).then((value) {
      recipeDetail = value;
      print(recipeDetail.title);
    });
    await Navigator.pushNamed(context, '/detail',
        arguments: {'detail': recipeDetail});
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Ink.image(
                image: NetworkImage(recipeModel.imageUrl),
                height: 240,
                fit: BoxFit.cover,
                child: InkWell(onTap: () {
                  route(recipeModel.id, context);
                }),
              ),
              Positioned(
                bottom: 16,
                right: 16,
                left: 16,
                child: Text(
                  recipeModel.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Chip(
                      labelPadding: EdgeInsets.all(2.0),
                      label: Text(
                        "Balance!!",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.redAccent,
                      elevation: 6.0,
                      shadowColor: Colors.grey[60],
                      padding: EdgeInsets.all(8.0),
                    ),
                    SizedBox(width: 2.0),
                    Chip(
                      labelPadding: EdgeInsets.all(2.0),
                      label: Text(
                        "Indian",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.green,
                      elevation: 6.0,
                      shadowColor: Colors.grey[60],
                      padding: EdgeInsets.all(8.0),
                    )
                  ],
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.grey,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
