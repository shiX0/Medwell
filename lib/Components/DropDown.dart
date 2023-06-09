import 'package:flutter/material.dart';

class DropDown<T> extends StatefulWidget {
  final List<T> items;
  final T selectedItem;
  final ValueChanged<T> onChanged;
  final String iconUrl;

  DropDown({
    required this.items,
    required this.selectedItem,
    required this.onChanged,
    required this.iconUrl,
  });

  @override
  _DropDownState<T> createState() => _DropDownState<T>();
}

class _DropDownState<T> extends State<DropDown<T>> {
  late T _selectedItem;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem;
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.5, // Set the width factor to 0.5 for half the width
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF8F8F6),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF8F8F6),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Image.network(
                widget.iconUrl,
                height: 50,
                width: 50,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF8F8F6),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextField(
                  controller: _textEditingController,
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
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: DropdownButton<T>(
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
                    }
                  },
                  style: TextStyle(color: Colors.black),
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
