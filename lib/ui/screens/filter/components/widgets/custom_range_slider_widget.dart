import 'package:flutter/material.dart';

import '../../../../../core/app/constants/app_dimensions.dart';
import '../../../../../core/app/constants/app_styles.dart';

// ignore: must_be_immutable
class CustomRangeSliderWidget extends StatefulWidget {
  final double minItemPrice;
  final double maxItemPrice;
  final int divisions;
  RangeValues itemPriceRange;
  final Function(RangeValues priceRange)? onChange;
  CustomRangeSliderWidget({
    super.key,
    this.minItemPrice = 0,
    this.maxItemPrice = 1000,
    this.divisions = 4,
    required this.itemPriceRange,
    this.onChange,
  });

  @override
  State<CustomRangeSliderWidget> createState() =>
      _CustomRangeSliderWidgetState();
}

class _CustomRangeSliderWidgetState extends State<CustomRangeSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SliderTheme(
          data: SliderThemeData(
              valueIndicatorColor: Colors.black87,
              trackHeight: 1.5,
              rangeValueIndicatorShape:
                  const PaddleRangeSliderValueIndicatorShape(),
              valueIndicatorTextStyle: customAppTextStyle(fontSize: 12),
              overlayShape: SliderComponentShape.noOverlay),
          child: RangeSlider(
              min: widget.minItemPrice,
              max: widget.maxItemPrice,
              values: widget.itemPriceRange,
              activeColor: Colors.black,
              inactiveColor: Colors.grey.shade300,
              divisions: widget.divisions,
              labels: RangeLabels(
                  "${priceLabel(priceRange: widget.itemPriceRange.start)}",
                  "${priceLabel(priceRange: widget.itemPriceRange.end)}"),
              onChanged: (value) {
                changeItemPriceRange(rangeValues: value);
                if (widget.onChange != null) widget.onChange!(value);
              }),
        ),
        kVSizedBox1,
        Row(
          children: List.generate(
            widget.divisions + 1,
            (index) {
              var isFirstItem = index == 0;
              var isLastItem = index == (widget.divisions + 1) - 1;
              var breakPointPrices = priceLabel(
                  priceRange: getPriceBreakPoints(
                      index: index,
                      isFirstItem: isFirstItem,
                      isLastItem: isLastItem));
              var selectedMinPriceRange =
                  priceLabel(priceRange: widget.itemPriceRange.start);
              var selectedMaxPriceRange =
                  priceLabel(priceRange: widget.itemPriceRange.end);
              var isSelectedPriceIdentical =
                  selectedMinPriceRange == breakPointPrices ||
                      selectedMaxPriceRange == breakPointPrices;

              return Expanded(
                flex: isFirstItem || isLastItem ? 0 : 1,
                child: Container(
                  alignment: isFirstItem
                      ? Alignment.topLeft
                      : isLastItem
                          ? Alignment.topRight
                          : Alignment.center,
                  width: 50,
                  child: CustomAppText(
                    text: "\$$breakPointPrices",
                    color: isSelectedPriceIdentical
                        ? Colors.black87
                        : Colors.grey.shade500,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  changeItemPriceRange({required RangeValues rangeValues}) {
    setState(() {
      widget.itemPriceRange = rangeValues;
    });
  }

  getPriceBreakPoints(
      {required int index,
      required bool isFirstItem,
      required bool isLastItem}) {
    return isFirstItem
        ? widget.minItemPrice
        : isLastItem
            ? widget.maxItemPrice
            : ((widget.maxItemPrice / widget.divisions) * index);
  }

  int priceLabel({required double priceRange}) =>
      double.parse("$priceRange").round();
}
