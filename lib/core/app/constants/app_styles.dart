import 'package:flutter/material.dart';
import 'package:shoesly/core/app/constants/app_texts.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';

// Custom textstyle to use throughout the app
TextStyle customAppTextStyle(
    {FontWeight? fontWeight,
    double? fontSize,
    Color? color,
    TextOverflow? textOverflow,
    TextDecoration? txtDecoration = TextDecoration.none,
    double letterSpacing = 0}) {
  return TextStyle(
    fontWeight: fontWeight,
    fontSize: fontSize,
    decoration: txtDecoration,
    color: color,
    letterSpacing: letterSpacing,
    overflow: textOverflow,
    fontFamily: AppTexts.fontFamily,
  );
}

// Custom text to use, for the uniformity of the text design
class CustomAppText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double letterSpacing;
  final int? maxLines;
  final TextOverflow textOverflow;
  final List<Shadow>? shadows;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final TextStyle? style;
  final Function()? onTap;
  final EdgeInsetsGeometry padding;

  const CustomAppText(
      {super.key,
      required this.text,
      this.color,
      this.fontWeight,
      this.fontSize,
      this.letterSpacing = 0.1,
      this.maxLines,
      this.textOverflow = TextOverflow.ellipsis,
      this.shadows,
      this.textDecoration = TextDecoration.none,
      this.textAlign = TextAlign.justify,
      this.onTap,
      this.padding = EdgeInsets.zero,
      this.style});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: padding,
          child: Text(
            text,
            textAlign: textAlign,
            style: style ??
                context.textTheme.bodyMedium?.copyWith(
                    color: color, fontSize: fontSize, fontWeight: fontWeight),
            maxLines: maxLines,
            overflow: maxLines != null ? textOverflow : null,
          ),
        ));
  }
}
