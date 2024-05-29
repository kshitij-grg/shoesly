import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/bloc/brand/brand_bloc.dart';

import '../../bloc/shoe/shoe_bloc.dart';

class BlocProviders {
  static List<BlocProvider> blocProviders = [
    BlocProvider<BrandBloc>(create: (context) => BrandBloc()),
    BlocProvider<ShoeBloc>(create: (context) => ShoeBloc()),
  ];
}
