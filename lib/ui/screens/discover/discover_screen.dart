import 'package:flutter/material.dart';
import 'package:shoesly/core/utils/responsive.dart';
import 'package:shoesly/core/utils/system_ui_overlay_style.dart';
import 'package:shoesly/ui/screens/discover/components/discover_body.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: systemUiOverlayStyle(context),
      child: Scaffold(
        body: Responsive(
          context: context,
          child: const DiscoverBody(),
        ),
      ),
    );
  }
}
