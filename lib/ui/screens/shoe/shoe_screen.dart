import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/app/constants/app_icons.dart';
import 'package:shoesly/core/routes/route_navigator.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';
import 'package:shoesly/ui/widgets/custom_svg_widget.dart';

import '../../../bloc/cart/cart_bloc.dart';
import '../../../core/routes/route_config.dart';
import '../../widgets/custom_appbar_widget.dart';
import '../../widgets/custom_circle_widget.dart';
import 'components/shoe_body.dart';

class ShoeScreen extends StatelessWidget {
  const ShoeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String shoeId = RouteNavigator.arguments(context) as String;
    return Scaffold(
      appBar: CustomAppbarWidget.customAppBar(
        context: context,
        trailing: GestureDetector(
          onTap: () =>
              RouteNavigator.navigateNamed(context, RouteConfig.cartRoute),
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Stack(
                alignment: Alignment.centerRight,
                children: [
                  CustomSvgWidget(
                    icon: kCartIcon,
                  ),
                  if (state.cartModelList?.isNotEmpty == true)
                    Positioned(
                      top: 5,
                      child: CustomCircleWidget(
                        backgroundColor: context.colors.error,
                        height: 8,
                        width: 8,
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
      body: ShoeBody(
        shoeId: shoeId,
      ),
    );
  }
}
