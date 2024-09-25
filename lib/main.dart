import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:property_search/Components/colors.dart';
import 'package:property_search/Widgets/amenities_switch.dart';
import 'package:property_search/Widgets/area_range_slider.dart';
import 'package:property_search/Widgets/availability_radio_button.dart';
import 'package:property_search/Widgets/price_range_slider.dart';
import 'package:property_search/Widgets/property_type.dart';

void main() {
  runApp(
    const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: PropertySearchScreen(),
    ),
  );
}

class PropertySearchScreen extends StatefulWidget {
  const PropertySearchScreen({super.key});
  @override
  PropertySearchScreenState createState() => PropertySearchScreenState();
}

class PropertySearchScreenState extends State<PropertySearchScreen> {
  int _selectedBedrooms = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: tertiaryColor,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(
            CupertinoIcons.back,
            color: primaryColor,
          ),
          onPressed: () {},
        ),
        middle: const Text(
          'Bangalore',
          style: TextStyle(color: Colors.black),
        ),
        trailing: const Icon(
          CupertinoIcons.search,
          size: 28,
          color: secondaryColor,
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildOptionButton('Buy', isSelected: true),
                    _buildOptionButton('Rent'),
                    _buildOptionButton('Project'),
                    _buildOptionButton('PG'),
                    _buildOptionButton('COM'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CupertinoTextField(
                  placeholder: 'Locality, projects or builders',
                  prefix: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(CupertinoIcons.search,
                        color: CupertinoColors.systemGrey),
                  ),
                  style: const TextStyle(
                    color: CupertinoColors
                        .black, // Set the color for the typed text
                  ),
                  placeholderStyle: const TextStyle(
                    color: CupertinoColors.systemGrey,
                  ),
                  // Change the background color
                  decoration: BoxDecoration(
                    color: CupertinoColors.white, // Set background color
                    borderRadius: BorderRadius.circular(
                        8.0), // Optional: rounding corners
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const PropertyType(),
              const SizedBox(height: 16),
              const PriceRangeSlider(),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text('Bed Rooms',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black)),
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
              const SizedBox(height: 16),
              const AvailabilityRadioButton(),
              const SizedBox(height: 16),
              const AreaRangeSlider(),
              const SizedBox(height: 16),
              const AmenitiesSwitch(),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: CupertinoButton(
                  color: primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                  child: const Text(
                    'Search',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton(String text, {bool isSelected = false}) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? secondaryColor : CupertinoColors.black,
          fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
        ),
      ),
      onPressed: () {},
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
          color:
              isSelected ? CupertinoColors.activeBlue : CupertinoColors.white,
          child: Text(
            text,
            style: TextStyle(
                color:
                    isSelected ? CupertinoColors.black : CupertinoColors.black),
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