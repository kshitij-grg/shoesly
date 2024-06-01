import 'package:flutter/material.dart';
import 'package:shoesly/core/app/constants/app_texts.dart';
import 'package:shoesly/ui/widgets/custom_appbar_widget.dart';

import 'components/cart_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget.customAppBar(
        context: context,
        title: AppTexts.cart,
      ),
      body: const CartBody(),
    );
  }
}
