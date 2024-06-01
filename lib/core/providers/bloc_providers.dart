import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/bloc/brand/brand_bloc.dart';

import '../../bloc/cart/cart_bloc.dart';
import '../../bloc/filter/filter_bloc.dart';
import '../../bloc/review/review_bloc.dart';
import '../../bloc/shoe/shoe_bloc.dart';

class BlocProviders {
  static List<BlocProvider> blocProviders = [
    BlocProvider<BrandBloc>(create: (context) => BrandBloc()),
    BlocProvider<ShoeBloc>(create: (context) => ShoeBloc()),
    BlocProvider<ReviewBloc>(create: (context) => ReviewBloc()),
    BlocProvider<CartBloc>(create: (context) => CartBloc()),
    BlocProvider<FilterBloc>(create: (context) => FilterBloc()),
  ];
}
