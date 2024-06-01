import 'package:flutter/material.dart';
import 'package:shoesly/core/app/constants/app_texts.dart';
import 'package:shoesly/ui/screens/order/components/order_body.dart';
import 'package:shoesly/ui/widgets/custom_appbar_widget.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget.customAppBar(
          context: context, title: AppTexts.orderSummary),
      body: const OrderBody(),
    );
  }
}
