import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:property_search/Components/colors.dart';
import 'package:property_search/Widgets/amenities_switch.dart';
import 'package:property_search/Widgets/area_range_slider.dart';
import 'package:property_search/Widgets/availability_radio_button.dart';
import 'package:property_search/Widgets/place_selection_bar.dart';
import 'package:property_search/Widgets/price_range_slider.dart';
import 'package:property_search/Widgets/property_type.dart';
import 'package:property_search/Widgets/room_count.dart';
import 'package:property_search/Widgets/search_query.dart';
import 'package:property_search/Widgets/top_nav_bar.dart';

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
  OverlayEntry? _overlayEntry;

  void _handleOverlayCreated(OverlayEntry overlayEntry) {
    _overlayEntry = overlayEntry;
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        _removeOverlay();
      },
      child: CupertinoPageScaffold(
        backgroundColor: tertiaryColor,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PlaceSelectionBar(),
                const Divider(
                  height: 1,
                ),
                const TopNavBar(),
                const SizedBox(height: 16),
                CupertinoSearchQuery(onOverlayCreated: _handleOverlayCreated),
                const SizedBox(height: 26),
                const PropertyType(),
                const SizedBox(height: 16),
                const PriceRangeSlider(),
                const SizedBox(height: 16),
                const BedRoomCount(),
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
      ),
    );
  }
}
