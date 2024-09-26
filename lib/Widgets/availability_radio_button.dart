import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:property_search/Components/colors.dart';

class AvailabilityRadioButton extends StatefulWidget {
  const AvailabilityRadioButton({super.key});

  @override
  State<AvailabilityRadioButton> createState() =>
      _AvailabilityRadioButtonState();
}

class _AvailabilityRadioButtonState extends State<AvailabilityRadioButton> {
  String _selectedAvailability = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0, bottom: 8),
          child: Text('Availability',
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black)),
        ),
        _buildAvailabilityOption('Ready To Move'),
        _buildAvailabilityOption('Within 6 Months'),
        _buildAvailabilityOption('Within 1 Year'),
        _buildAvailabilityOption('More Than 1 Year'),
      ],
    );
  }

  Widget _buildAvailabilityOption(String text) {
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
          CupertinoRadio(
            inactiveColor: const Color.fromARGB(255, 235, 232, 232),
            activeColor: secondaryColor,
            fillColor: Colors.white,
            value: text,
            groupValue: _selectedAvailability,
            onChanged: (value) {
              setState(() {
                _selectedAvailability = value.toString();
              });
            },
          ),
        ],
      ),
    );
  }
}
