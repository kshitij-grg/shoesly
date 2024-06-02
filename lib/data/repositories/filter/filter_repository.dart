import 'package:shoesly/data/models/app_static/app_static_model.dart';

class FilterRepository {
  var sortbyList = <AppStaticModel>[
    AppStaticModel(
      id: "recent",
      value: "Most recent",
    ),
    AppStaticModel(
      id: "lowest",
      value: "Lowest price",
    ),
    AppStaticModel(
      id: "highest",
      value: "Highest price",
    ),
  ];

  var genderList = ["Man", "Woman", "Unisex"];

  var colorList = ["Black", "Blue", "Red"];
}
