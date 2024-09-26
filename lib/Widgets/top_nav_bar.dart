import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:property_search/Components/colors.dart';

class TopNavBar extends StatefulWidget {
  const TopNavBar({super.key});

  @override
  State<TopNavBar> createState() => _TopNavBarState();
}

class _TopNavBarState extends State<TopNavBar> {
  String _selectedOption = 'Buy'; // Track the selected button

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildOptionButton('Buy'),
          _buildOptionButton('Rent'),
          _buildOptionButton('Project'),
          _buildOptionButton('PG'),
          _buildOptionButton('COM'),
        ],
      ),
    );
  }

  Widget _buildOptionButton(String text) {
    bool isSelected =
        _selectedOption == text; // Check if the button is selected
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      onPressed: () {
        setState(() {
          _selectedOption = text; // Update the selected option
        });
      },
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              color: isSelected ? secondaryColor : CupertinoColors.black,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
