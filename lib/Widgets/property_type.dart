import 'package:flutter/material.dart';
import 'package:property_search/Components/colors.dart';

class PropertyType extends StatefulWidget {
  const PropertyType({super.key});

  @override
  State<PropertyType> createState() => _PropertyTypeState();
}
class _PropertyTypeState extends State<PropertyType> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [ const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text('Property Type',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black)),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildPropertyTypeButton(
                      'Apartment',
                      Icons.apartment,
                    ),
                    _buildPropertyTypeButton('Villa', Icons.house),
                    _buildPropertyTypeButton('Plot', Icons.landscape),
                    _buildPropertyTypeButton('Builder\nFloor', Icons.business),
                  ],
                ),
              ),],);
  }
   Widget _buildPropertyTypeButton(String text, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 40, color: secondaryColor),
        const SizedBox(height: 4),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}