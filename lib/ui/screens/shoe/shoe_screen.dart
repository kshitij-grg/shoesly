import 'package:flutter/material.dart';
import 'package:shoesly/core/app/constants/app_icons.dart';
import 'package:shoesly/core/routes/route_navigator.dart';
import 'package:shoesly/ui/widgets/custom_svg_widget.dart';

import '../../widgets/custom_appbar_widget.dart';
import 'components/shoe_body.dart';

class ShoeScreen extends StatelessWidget {
  const ShoeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String shoeId = RouteNavigator.arguments(context) as String;
    return Scaffold(
      appBar: CustomAppbarWidget.customAppBar(
        context: context,
        trailing: CustomSvgWidget(
          icon: kCartIcon,
        ),
      ),
      body: ShoeBody(
        shoeId: shoeId,
      ),
    );
  }
}
