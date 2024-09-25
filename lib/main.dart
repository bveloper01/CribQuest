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

// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:property_search/Components/colors.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: PropertySearchScreen(),
//     ),
//   );
// }

// class PropertySearchScreen extends StatefulWidget {
//   @override
//   _PropertySearchScreenState createState() => _PropertySearchScreenState();
// }

// class _PropertySearchScreenState extends State<PropertySearchScreen> {
//   RangeValues _priceRangeValues = RangeValues(0, 10);
//   RangeValues _areaRangeValues = RangeValues(0, 5000);
//   int _selectedBedrooms = 0;
//   String _selectedAvailability = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios),
//           onPressed: () {},
//         ),
//         title: Text('Bangalore'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   _buildOptionButton('Buy', isSelected: true),
//                   _buildOptionButton('Rent'),
//                   _buildOptionButton('Project'),
//                   _buildOptionButton('PG'),
//                   _buildOptionButton('COM'),
//                 ],
//               ),
//               SizedBox(height: 16),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Locality, projects or builders',
//                   prefixIcon: Icon(Icons.search),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16),
//               Text('Property Type',
//                   style: TextStyle(fontWeight: FontWeight.bold)),
//               SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   _buildPropertyTypeButton('Apartment', Icons.apartment),
//                   _buildPropertyTypeButton('Villa', Icons.house),
//                   _buildPropertyTypeButton('Plot', Icons.landscape),
//                   _buildPropertyTypeButton('Builder\nFloor', Icons.business),
//                 ],
//               ),
//               SizedBox(height: 16),
//               Text('Price Range',
//                   style: TextStyle(fontWeight: FontWeight.bold)),
//               RangeSlider(
//                 values: _priceRangeValues,
//                 min: 0,
//                 max: 10,
//                 divisions: 10,
//                 labels: RangeLabels(
//                   '₹${_priceRangeValues.start.round()}',
//                   '₹${_priceRangeValues.end.round()}Cr+',
//                 ),
//                 onChanged: (RangeValues values) {
//                   setState(() {
//                     _priceRangeValues = values;
//                   });
//                 },
//               ),
//               SizedBox(height: 16),
//               Text('Bed Rooms', style: TextStyle(fontWeight: FontWeight.bold)),
//               SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   _buildBedroomButton('1'),
//                   _buildBedroomButton('2'),
//                   _buildBedroomButton('3'),
//                   _buildBedroomButton('4'),
//                   _buildBedroomButton('4+'),
//                 ],
//               ),
//               SizedBox(height: 16),
//               Text('Availability',
//                   style: TextStyle(fontWeight: FontWeight.bold)),
//               _buildAvailabilityOption('Ready To Move'),
//               _buildAvailabilityOption('Within 6 Months'),
//               _buildAvailabilityOption('Within 1 Year'),
//               _buildAvailabilityOption('More Than 1 Year'),
//               SizedBox(height: 16),
//               Text('Area', style: TextStyle(fontWeight: FontWeight.bold)),
//               RangeSlider(
//                 values: _areaRangeValues,
//                 min: 0,
//                 max: 5000,
//                 divisions: 50,
//                 labels: RangeLabels(
//                   '${_areaRangeValues.start.round()} sqft',
//                   '${_areaRangeValues.end.round()} sqft',
//                 ),
//                 onChanged: (RangeValues values) {
//                   setState(() {
//                     _areaRangeValues = values;
//                   });
//                 },
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 child: Text('Search'),
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(double.infinity, 50),
//                 ),
//                 onPressed: () {},
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildOptionButton(String text, {bool isSelected = false}) {
//     return TextButton(
//       child: Text(
//         text,
//         style: TextStyle(
//           color: isSelected ? Colors.blue : Colors.black,
//           fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//         ),
//       ),
//       onPressed: () {},
//     );
//   }

//   Widget _buildPropertyTypeButton(String text, IconData icon) {
//     return Column(
//       children: [
//         Icon(icon, size: 40, color: Colors.blue),
//         SizedBox(height: 4),
//         Text(text, textAlign: TextAlign.center),
//       ],
//     );
//   }

//   Widget _buildBedroomButton(String text) {
//     bool isSelected = _selectedBedrooms.toString() == text;
//     return ElevatedButton(
//       child: Text(text),
//       style: ElevatedButton.styleFrom(
//         primary: isSelected ? Colors.blue : Colors.grey[200],
//         onPrimary: isSelected ? Colors.white : Colors.black,
//       ),
//       onPressed: () {
//         setState(() {
//           _selectedBedrooms = int.tryParse(text) ?? 0;
//         });
//       },
//     );
//   }

//   Widget _buildAvailabilityOption(String text) {
//     return RadioListTile(
//       title: Text(text),
//       value: text,
//       groupValue: _selectedAvailability,
//       onChanged: (value) {
//         setState(() {
//           _selectedAvailability = value.toString();
//         });
//       },
//     );
//   }
// }
