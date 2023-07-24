import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDown<T> extends StatefulWidget {
  final List<T> items;
  final T selectedItem;
  final ValueChanged<T> onChanged;
  final String iconUrl;
  final TextEditingController dropDownController;
  final TextEditingController textFieldController;

  DropDown({
    required this.items,
    required this.selectedItem,
    required this.onChanged,
    required this.iconUrl,
    required this.dropDownController,
    required this.textFieldController,
  });

  @override
  _DropDownState<T> createState() => _DropDownState<T>();
}

class _DropDownState<T> extends State<DropDown<T>> {
  late T _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF8F8F6),
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Row(
          children: [
            SizedBox(width: 10,),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF8F8F6),
                borderRadius: BorderRadius.circular(14.0),
              ),
              child: Image.asset(
                widget.iconUrl,
                // height: 50,
                // width: 50,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF8F8F6),
                  borderRadius: BorderRadius.circular(14.0),

                ),
                child: TextField(
                  controller: widget.textFieldController,
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.headlineMedium,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,

                  ),
                  decoration: InputDecoration(
                    hintText: '',
                    border: InputBorder.none,

                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            DropdownButtonHideUnderline(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF8F8F6),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: DropdownButton<T>(
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.headlineMedium,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  value: _selectedItem,
                  items: widget.items.map((T item) {
                    return DropdownMenuItem<T>(
                      value: item,
                      child: Text(item.toString()),
                    );
                  }).toList(),
                  onChanged: (T? selectedItem) {
                    if (selectedItem != null) {
                      setState(() {
                        _selectedItem = selectedItem;
                      });
                      widget.onChanged(selectedItem);
                      widget.dropDownController.text = selectedItem.toString(); // Update the drop down controller's value
                      widget.textFieldController.text = ''; // Clear the text field's value
                    }
                  },
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
