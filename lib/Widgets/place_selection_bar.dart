import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:property_search/Components/colors.dart';

class PlaceSelectionBar extends StatefulWidget {
  const PlaceSelectionBar({super.key});

  @override
  State<PlaceSelectionBar> createState() => _PlaceSelectionBarState();
}

class _PlaceSelectionBarState extends State<PlaceSelectionBar> {
  String? selectedState;
  String? selectedCity;

  final List<String> states = [
    'Karnataka',
    'Delhi',
    'Maharashtra',
    'Chennai',
    'Rajasthan',
  ];

  final Map<String, List<String>> cities = {
    'Karnataka': ['Bangalore', 'Mysore', 'Hubli', 'Mangalore', 'Belgaum'],
    'Delhi': [
      'New Delhi',
      'Connaught Place',
      'Chandni Chowk',
      'Karol Bagh',
      'Dwarka'
    ],
    'Maharashtra': ['Mumbai', 'Pune', 'Nagpur', 'Nashik', 'Aurangabad'],
    'Chennai': ['Chennai', 'Coimbatore', 'Madurai', 'Tiruchirappalli', 'Salem'],
    'Rajasthan': ['Jaipur', 'Jodhpur', 'Udaipur', 'Kota', 'Ajmer'],
  };

  void _resetSelection() {
    setState(() {
      selectedState = null;
      selectedCity = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53,
      color: Colors.white,
      child: Row(
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Icon(
              CupertinoIcons.back,
              color: secondaryColor,
              size: 28,
            ),
            onPressed: () {},
          ),
          Expanded(
            child: CupertinoButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      selectedCity ?? selectedState ?? 'Select Location',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  if (selectedCity != null || selectedState != null)
                    GestureDetector(
                      onTap: _resetSelection,
                      child: const Icon(
                        CupertinoIcons.clear_circled_solid,
                        size: 20,
                        color: secondaryColor,
                      ),
                    ),
                ],
              ),
              onPressed: () {
                if (selectedState == null) {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                      title: const Text('Select State'),
                      actions: List.generate(
                        states.length,
                        (index) => CupertinoActionSheetAction(
                          child: Text(states[index]),
                          onPressed: () {
                            setState(() {
                              selectedState = states[index];
                            });
                            Navigator.pop(context);
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) => CupertinoActionSheet(
                                title: const Text('Select City'),
                                actions: List.generate(
                                  cities[selectedState]!.length,
                                  (index) => CupertinoActionSheetAction(
                                    child: Text(cities[selectedState]![index]),
                                    onPressed: () {
                                      setState(() {
                                        selectedCity =
                                            cities[selectedState]![index];
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                cancelButton: CupertinoActionSheetAction(
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      cancelButton: CupertinoActionSheetAction(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                } else {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                      title: const Text('Select City'),
                      actions: List.generate(
                        cities[selectedState]!.length,
                        (index) => CupertinoActionSheetAction(
                          child: Text(cities[selectedState]![index]),
                          onPressed: () {
                            setState(() {
                              selectedCity = cities[selectedState]![index];
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      cancelButton: CupertinoActionSheetAction(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          const Icon(
            CupertinoIcons.search,
            size: 28,
            color: secondaryColor,
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
