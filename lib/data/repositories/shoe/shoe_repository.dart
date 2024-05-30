import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/data/models/shoe/shoe_model.dart';
import 'package:shoesly/di_injection/get_di_init.dart';

import '../../../bloc/shoe/shoe_bloc.dart';
import '../../models/filter/filter_model.dart';

class ShoeRepository {
  Future<ShoeModel> fetchShoeDetails({required String shoeId}) =>
      shoeApiClient.fetchShoeDetails(shoeId: shoeId);

  Future<List<ShoeModel>> fetchShoes(
          {FilterModel? filterModel, bool hasFilter = true}) =>
      shoeApiClient.fetchShoes(filterModel: filterModel, hasFilter: hasFilter);

  initShoeScreen({required BuildContext context, required String shoeId}) {
    var shoeBloc = context.read<ShoeBloc>();

    shoeBloc.add(ShoeDetailsFetched(shoeId: shoeId));
    shoeBloc.add(const ShoeImageSwitched());
    shoeBloc.add(const ShoeSizeSelected(size: ""));
    shoeBloc.add(const ShoeColorSelected(color: ""));
  }
}
