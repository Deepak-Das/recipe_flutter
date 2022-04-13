import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:recipe_flutter/Model/recipeDetail.dart';
import 'package:recipe_flutter/pages/util/title.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  var obj = {};
  late RecipeDetail detail;

  @override
  void initState() {
    super.initState();
  }

  // https://api.spoonacular.com/recipes/716429/information?includeNutrition=false&apiKey=3accc771d80c4f03a0c2c39151562701
  @override
  Widget build(BuildContext context) {

    obj = ModalRoute.of(context)?.settings.arguments as Map;
    setState(() {
      detail = obj['detail'];
    });

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: CustomeTitle(title: detail.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Ink.image(
                image: NetworkImage(detail.imageUrl),
                height: 240,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      detail.title,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.red, fontSize: 24.0),
                    ),
                  ),
                  Html(data: detail.summary),
                  DataTable(columns: [
                    DataColumn(
                      label: Text('Info'),
                    ),
                    DataColumn(
                      label: Text('Yes/No'),
                    ),
                  ], rows: [
                    DataRow(cells: [
                      DataCell(Text("Vegetarian")),
                      DataCell(Text(detail.vegetarian)),
                    ]),
                    DataRow(cells: [
                      DataCell(Text("Vegan")),
                      DataCell(Text(detail.vegan)),
                    ]),
                    DataRow(cells: [
                      DataCell(Text("Dairy Free")),
                      DataCell(Text(detail.dairyFree)),
                    ]),
                    DataRow(cells: [
                      DataCell(Text("Gluten Free")),
                      DataCell(Text(detail.glutenFree)),
                    ])
                  ]),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
