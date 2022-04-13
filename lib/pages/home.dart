import 'package:flutter/material.dart';
import 'package:recipe_flutter/pages/util/recipeinfo.dart';
import 'package:recipe_flutter/pages/util/title.dart';

class Home extends StatefulWidget {
  // const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController _textController;
  late RecipeInfo recipeInfo;

  Future<void> getrecipe(String s) async {
    recipeInfo=RecipeInfo();
    await recipeInfo.getRecips(s);

  }

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _textController.addListener(() {
      // print("text controller: ${_textController.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomeTitle(title: "Recipes App"),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/food1.jpg"), fit: BoxFit.fill),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.amberAccent[100],
                    hintText: 'Enter The Dish name',
                    suffixIcon: GestureDetector(
                        onTap: () async {
                          await getrecipe(_textController.text);
                          if(recipeInfo.recipeList.isNotEmpty){
                            Navigator.pushNamed(context, '/recipes',arguments: {
                              "list": recipeInfo.recipeList
                            }
                            );
                          }else{
                            print("Empty");
                          }
                        },
                        child: Icon(Icons.search)),
                    prefixIcon: Icon(
                      Icons.fastfood_outlined,
                      color: Colors.red,
                    ),
                  ),
                  controller: _textController,
                ),
              ),
            ),
          ),
        ));
  }
}
