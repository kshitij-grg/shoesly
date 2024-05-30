import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/bloc/shoe/shoe_bloc.dart';
import 'package:shoesly/core/app/constants/app_texts.dart';

import '../../../bloc/brand/brand_bloc.dart';

class DiscoverRepository {
  initDiscoverScreen({required BuildContext context}) {
    var brandBloc = context.read<BrandBloc>();

    brandBloc.add(const BrandFetched(hasAllKeyword: true));
    brandBloc.add(const BrandSelected(selectedBrand: AppTexts.all));

    context.read<ShoeBloc>().add(const ShoeFetched(hasFilter: false));
  }
}
