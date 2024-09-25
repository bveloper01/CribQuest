import 'package:flutter/material.dart';
import 'package:property_search/Components/colors.dart';

class PriceRangeSlider extends StatefulWidget {
  const PriceRangeSlider({super.key});

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  RangeValues _priceRangeValues = const RangeValues(0, 10);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text('Price Range',
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black)),
        ),
        const SizedBox(height: 8),
        // Wrapping RangeSlider in a Material widget
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'MIN\n₹${_priceRangeValues.start.round()}Cr',
                style: const TextStyle(color: Colors.black),
              ),
              Text('MAX\n₹${_priceRangeValues.end.round()}Cr+',
                  style: const TextStyle(color: Colors.black)),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: Material(
            child: SliderTheme(
              data: const SliderThemeData(
                activeTrackColor: primaryColor,
                thumbColor: primaryColor,
              ),
              child: RangeSlider(
                values: _priceRangeValues,
                min: 0,
                max: 10,
                divisions: 10,
                labels: RangeLabels(
                  '₹${_priceRangeValues.start.round()}Cr',
                  '₹${_priceRangeValues.end.round()}Cr+',
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _priceRangeValues = values;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
