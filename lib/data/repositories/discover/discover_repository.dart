import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/brand/brand_bloc.dart';

class DiscoverRepository {
  initDiscoverScreen({required BuildContext context}) {
    context.read<BrandBloc>().add(BrandFetched());
  }
}
