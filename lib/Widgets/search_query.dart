import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSearchQuery extends StatefulWidget {
  final Function(OverlayEntry) onOverlayCreated;
  const CupertinoSearchQuery({Key? key, required this.onOverlayCreated})
      : super(key: key);

  @override
  State<CupertinoSearchQuery> createState() => _CupertinoSearchQueryState();
}

class _CupertinoSearchQueryState extends State<CupertinoSearchQuery> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  OverlayEntry? _overlayEntry;
  List<String> recentSearches = ['Hoodi'];
  List<String> localities = ['Koramangala', 'Whitefield', 'H.S.R Layout'];
  List<String> projects = [
    'Windsor Four Seasons',
    'Purva Fountain Square',
    'Keerthi Pride'
  ];

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      _showOverlay();
    } else {
      _removeOverlay();
    }
  }

  void _showOverlay() {
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).viewPadding.top + kToolbarHeight + 100,
        right: 16,
        child: Material(
          elevation: 4.0,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            color: CupertinoColors.white,
            child: _buildSearchOverlay(),
          ),
        ),
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
    widget.onOverlayCreated(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: CupertinoTextField(
        controller: _controller,
        focusNode: _focusNode,
        placeholder: 'Locality, projects or builders',
        prefix: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(CupertinoIcons.search, color: CupertinoColors.systemGrey),
        ),
        style: const TextStyle(color: CupertinoColors.black),
        placeholderStyle: const TextStyle(color: CupertinoColors.systemGrey),
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        onSubmitted: (value) {
          print('Searching for: $value');
          setState(() {
            if (!recentSearches.contains(value)) {
              recentSearches.insert(0, value);
            }
          });
          _controller.clear();
          _focusNode.unfocus();
        },
        textInputAction: TextInputAction.search,
      ),
    );
  }

  Widget _buildSearchOverlay() {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.7,
      height: MediaQuery.sizeOf(context).height * 0.38,
      color: CupertinoColors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection('RECENT SEARCH', recentSearches, CupertinoIcons.clock,
                showClearAll: true),
            _buildSection(
                'LOCALITY', localities, CupertinoIcons.building_2_fill),
            _buildSection('PROJECTS', projects, CupertinoIcons.home),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<String> items, IconData icon,
      {bool showClearAll = false}) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
            color: const Color.fromARGB(31, 113, 113, 113),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 15)),
                if (showClearAll)
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Text(
                      'Clear All',
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                    onPressed: () {
                      setState(() {
                        recentSearches.clear();
                      });
                      _overlayEntry
                          ?.markNeedsBuild(); // Immediately rebuild the overlay
                    },
                  ),
              ],
            ),
          ),
          ...items.map((item) => _buildSearchItem(icon, item)).toList(),
        ],
      ),
    );
  }

  Widget _buildSearchItem(IconData icon, String text) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      onPressed: () {
        _controller.text = text;
        _focusNode.unfocus();
      },
      child: Row(
        children: [
          Icon(icon, color: CupertinoColors.systemGrey),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(color: CupertinoColors.black)),
        ],
      ),
    );
  }
}
