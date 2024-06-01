import 'package:shoesly/data/models/app_static/app_static_model.dart';

class FilterRepository {
  var sortbyList = <AppStaticModel>[
    AppStaticModel(
      id: "",
      value: "Most recent",
    ),
    AppStaticModel(
      id: "",
      value: "Lowest price",
    ),
    AppStaticModel(
      id: "",
      value: "Highest price",
    ),
  ];

  var genderList = ["Man", "Woman", "Unisex"];

  var colorList = ["Black", "Blue", "Red"];
}
