import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/theme_extensions.dart';

class CustomSvgWidget extends StatelessWidget {
  final Color? color;
  final String icon;
  final double? height;
  final Function()? onTap;
  final EdgeInsetsGeometry padding;
  final double? width;
  final BoxFit fit;
  final bool isColorFiltered;
  const CustomSvgWidget(
      {super.key,
      this.color,
      required this.icon,
      this.height,
      this.onTap,
      this.padding = EdgeInsets.zero,
      this.isColorFiltered = true,
      this.width,
      this.fit = BoxFit.contain});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: SvgPicture.asset(
          fit: fit,
          icon,
          colorFilter: isColorFiltered
              ? color != null
                  ? ColorFilter.mode(color!, BlendMode.srcIn)
                  : ColorFilter.mode(context.iconTheme.color!, BlendMode.srcIn)
              : null,
          height: height,
          width: width,
        ),
      ),
    );
  }
}
