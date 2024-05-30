import 'package:flutter/material.dart';
import 'package:shoesly/core/utils/responsive.dart';
import 'package:shoesly/ui/screens/filter/components/filter_body.dart';

import '../../widgets/custom_appbar_widget.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget.customAppBar(
        context: context,
        title: "Filter",
      ),
      body: Responsive(
        context: context,
        child: const FilterBody(),
      ),
    );
  }
}
