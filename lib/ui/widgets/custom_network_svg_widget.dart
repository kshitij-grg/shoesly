import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';

class CustomNetworkSvgWidget extends StatelessWidget {
  final Color? color;
  final String icon;
  final double? height;
  final Function()? onTap;
  final EdgeInsetsGeometry padding;
  final double? width;
  final BoxFit fit;
  const CustomNetworkSvgWidget(
      {super.key,
      this.color,
      required this.icon,
      this.height,
      this.onTap,
      this.padding = EdgeInsets.zero,
      this.width,
      this.fit = BoxFit.contain});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: SvgPicture.network(
          fit: fit,
          icon,
          colorFilter: color != null
              ? ColorFilter.mode(color!, BlendMode.srcIn)
              : ColorFilter.mode(context.iconTheme.color!, BlendMode.srcIn),
          height: height,
          width: width,
        ),
      ),
    );
  }
}
