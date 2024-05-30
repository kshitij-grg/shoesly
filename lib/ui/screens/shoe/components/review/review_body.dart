import 'package:flutter/material.dart';
import 'package:shoesly/ui/widgets/custom_appbar_widget.dart';

class ReviewBody extends StatelessWidget {
  const ReviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget.customAppBar(
        context: context,
      ),
    );
  }
}
