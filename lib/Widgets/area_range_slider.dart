import 'package:flutter/material.dart';
import 'package:property_search/Components/colors.dart';

class AreaRangeSlider extends StatefulWidget {
  const AreaRangeSlider({super.key});

  @override
  State<AreaRangeSlider> createState() => _AreaRangeSliderState();
}

class _AreaRangeSliderState extends State<AreaRangeSlider> {
  RangeValues _areaRangeValues = const RangeValues(0, 5000);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text('Area',
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black)),
        ),
        const SizedBox(height: 8),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'MIN\n${_areaRangeValues.start.round()} Sqft',
                style: const TextStyle(color: Colors.black),
              ),
              Text(
                'MAX\n${_areaRangeValues.end.round()} Sqft',
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.sizeOf(context).width,
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: Material(
            color: Colors.white,
            child: SliderTheme(
              data: const SliderThemeData(
                activeTrackColor: primaryColor,
                thumbColor: primaryColor,
              ),
              child: RangeSlider(
                values: _areaRangeValues,
                min: 0,
                max: 5000,
                divisions: 50,
                labels: RangeLabels(
                  'MIN\n${_areaRangeValues.start.round()}Sqft',
                  'MAX\n${_areaRangeValues.end.round()}Sqft',
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _areaRangeValues = values;
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
