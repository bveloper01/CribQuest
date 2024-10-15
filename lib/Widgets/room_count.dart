import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:property_search/Components/colors.dart';

class BedRoomCount extends StatefulWidget {
  const BedRoomCount({super.key});
  @override
  State<BedRoomCount> createState() => _BedRoomCountState();
}

class _BedRoomCountState extends State<BedRoomCount> {
  int? minRooms; // null to represent the initial zero values
  int? maxRooms; // null to represent the initial zero values
  // function to increment Min Rooms
  void incrementMinRooms() {
    setState(() {
      if (minRooms == null) {
        minRooms = 1; // Start counting from 1
      } else if (minRooms! < 19) {
        minRooms = minRooms! + 1;
      }
      // Reset max if min becomes higher
      if (maxRooms != null && minRooms! >= maxRooms!) {
        maxRooms = null; // Reset max to allow new increments
      }
    });
  }

  // function to decrement Min Rooms
  void decrementMinRooms() {
    setState(() {
      if (minRooms != null && minRooms! > 0) {
        minRooms = minRooms! - 1;
      }
      if (minRooms == 0) {
        minRooms = null; // Hide 0 in the text widget
      }
    });
  }

  // Increment Max Rooms
  void incrementMaxRooms() {
    setState(() {
      if (maxRooms == null) {
        maxRooms = (minRooms ?? 0) + 1; // Start max from min + 1
      } else if (maxRooms! < 20) {
        maxRooms = maxRooms! + 1;
      }
    });
  }

  // Decrement Max Rooms (allow max to reach 0 and be null)
  void decrementMaxRooms() {
    setState(() {
      if (maxRooms != null && maxRooms! > 0) {
        maxRooms = maxRooms! - 1;
      }
      if (maxRooms == 0) {
        maxRooms = null; // Reset to null (hide 0 in the text widget)
      }
      // Reset minRooms if maxRooms <= minRooms, starting over
      if (maxRooms != null && minRooms != null && maxRooms! <= minRooms!) {
        minRooms = null; // Reset minRooms to the initial empty state
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, bottom: 8),
          child: Text('Bed Rooms',
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black)),
        ),
        // Min Counter Row
        Container(
          margin: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 45,
                    child: Text(
                      "Min: ", // Display empty if null
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 16),
                  _buildButton(
                    icon: Icons.remove,
                    onPressed: decrementMinRooms,
                    isDisabled: minRooms == null ||
                        minRooms == 0, // Disable if min is null or 0
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.1,
                    child: Center(
                      child: Text(
                        minRooms?.toString() ?? "", // Display empty if null
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  _buildButton(
                    icon: Icons.add,
                    onPressed: incrementMinRooms,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Max Counter Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 45,
                    child: Text(
                      "Max: ", // Display empty if null
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 16),
                  _buildButton(
                    icon: Icons.remove,
                    onPressed: decrementMaxRooms,
                    isDisabled: maxRooms == null, // Disable if max is null
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.1,
                    child: Center(
                      child: Text(
                        maxRooms?.toString() ?? "", // Display empty if null
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  _buildButton(
                    icon: Icons.add,
                    onPressed: incrementMaxRooms,
                    isDisabled: maxRooms == 20, // Disable if max is 20
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButton({
    required IconData icon,
    required VoidCallback onPressed,
    bool isDisabled = false,
  }) {
    return CupertinoButton(
      minSize: 0,
      borderRadius: const BorderRadius.all(Radius.circular(0.0)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: isDisabled ? CupertinoColors.inactiveGray : secondaryColor,
      onPressed: isDisabled ? null : onPressed,
      child: Icon(
        icon,
        color: isDisabled ? Colors.white70 : CupertinoColors.white,
      ),
    );
  }
}
