import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownOnly<T> extends StatefulWidget {
  final List<T> items;
  final T selectedItem;
  final ValueChanged<T?> onChanged;

  const DropDownOnly({
    Key? key,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
  }) : super(key: key);

  @override
  _DropDownOnlyState<T> createState() => _DropDownOnlyState<T>();
}

class _DropDownOnlyState<T> extends State<DropDownOnly<T>> {
  T? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF8F8F6), // Use the same background color as the DropdownButton
          borderRadius: BorderRadius.circular(14.0), // Customize the border radius if needed
        ),
        padding: EdgeInsets.symmetric(horizontal: 14.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            style: GoogleFonts.poppins(textStyle: Theme.of(context).textTheme.headlineMedium,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 14),
            value: _selectedItem,
            onChanged: (T? newValue) {
              setState(() {
                _selectedItem = newValue;
              });
              widget.onChanged(newValue);
            },
            icon: Icon(
              Icons.arrow_drop_down, // Set the dropdown arrow icon
              color: Theme.of(context).textTheme.bodyText1!.color, // Match the icon color with the dropdown text color
            ),
            iconSize: 24.0,
            isExpanded: true,
            dropdownColor: Color(0xFFF8F8F6), // Use the same background color as the Container
            items: widget.items.map((T item) {
              return DropdownMenuItem<T>(
                value: item,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    item.toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
