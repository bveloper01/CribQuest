import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:property_search/Components/colors.dart';

class AmenitiesSwitch extends StatefulWidget {
  const AmenitiesSwitch({super.key});

  @override
  State<AmenitiesSwitch> createState() => _AmenitiesSwitchState();
}

class _AmenitiesSwitchState extends State<AmenitiesSwitch> {
  bool _gymSelected = false;
  bool _liftSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0, bottom: 8),
          child: Text('Amenities',
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black)),
        ),
        Column(
          children: [
            _buildAmenityOption('Gym'),
            _buildAmenityOption('Lift'),
            Container(
              margin: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              child: Center(
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Text('+ View More Amenities',
                      style: TextStyle(color: CupertinoColors.black)),
                  onPressed: () {
                    // Handle view more amenities
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAmenityOption(String text) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.black),
          ),
          CupertinoSwitch(
            activeColor: secondaryColor,
            value: text == 'Gym' ? _gymSelected : _liftSelected,
            onChanged: (bool value) {
              setState(() {
                if (text == 'Gym') {
                  _gymSelected = value;
                } else {
                  _liftSelected = value;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
