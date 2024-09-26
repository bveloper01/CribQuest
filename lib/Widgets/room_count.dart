import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:property_search/Components/colors.dart';

class BedRoomCount extends StatefulWidget {
  const BedRoomCount({super.key});

  @override
  State<BedRoomCount> createState() => _BedRoomCountState();
}
class _BedRoomCountState extends State<BedRoomCount> {
  int _selectedBedrooms = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text('Bed Rooms',
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
          child: Row(
            children: [
              _buildBedroomButton('1'),
              _buildBedroomButton('2'),
              _buildBedroomButton('3'),
              _buildBedroomButton('4'),
              _buildBedroomButton('4+'),
            ],
          ),
        ),
      ],
    );
  }
  Widget _buildBedroomButton(String text) {
    bool isSelected = _selectedBedrooms.toString() == text;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 3),
        child: CupertinoButton(
          borderRadius: const BorderRadius.all(Radius.circular(0.0)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: isSelected ? secondaryColor : CupertinoColors.white,
          child: Text(
            text,
            style: TextStyle(
                color:
                    isSelected ? CupertinoColors.white : CupertinoColors.black),
          ),
          onPressed: () {
            setState(() {
              _selectedBedrooms = int.tryParse(text) ?? 0;
            });
          },
        ),
      ),
    );
  }
}
