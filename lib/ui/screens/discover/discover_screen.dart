import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/app/constants/app_dimensions.dart';
import 'package:shoesly/core/app/constants/app_icons.dart';
import 'package:shoesly/core/app/constants/app_texts.dart';
import 'package:shoesly/core/enums/enum.dart';
import 'package:shoesly/core/utils/responsive.dart';
import 'package:shoesly/core/utils/system_ui_overlay_style.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';
import 'package:shoesly/ui/screens/discover/components/discover_body.dart';
import 'package:shoesly/ui/widgets/custom_button_widget.dart';

import '../../../bloc/brand/brand_bloc.dart';
import '../../../core/routes/route_config.dart';
import '../../../core/routes/route_navigator.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: systemUiOverlayStyle(context),
      child: BlocBuilder<BrandBloc, BrandState>(
        builder: (context, state) {
          return DefaultTabController(
            length: state.brandModelListWithAll?.length ?? 0,
            child: Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton:
                  CustomButton(buttonType: ButtonType.icon).widget(
                runCode: () => RouteNavigator.navigateNamed(
                    context, RouteConfig.filterRoute),
                context: context,
                width: appWidth(context) / 2.8,
                title: AppTexts.filter,
                icon: kFilterIcon,
                titleColor: context.colors.white,
                iconColor: context.colors.white,
                backGroundColor: context.colors.primary,
              ),
              body: Responsive(
                context: context,
                child: const DiscoverBody(),
              ),
            ),
          );
        },
      ),
    );
  }
}
