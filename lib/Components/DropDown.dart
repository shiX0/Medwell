import 'package:flutter/material.dart';

// THIS IS HOW YOU USE THIS COMPONENT
//Do not change the "onChanged" part
// DropDown(items: ['Option 1','Option 2'], selectedItem: 'Option 1', onChanged:(String selectedItem){})



class DropDown<T> extends StatefulWidget {
  final List<T> items;
  final T selectedItem;
  final ValueChanged<T> onChanged;

  DropDown({required this.items,required this.selectedItem,required this.onChanged,});

  @override
  _DropDownState<T> createState() => _DropDownState<T>();
}

class _DropDownState<T>
    extends State<DropDown<T>> {
  late T _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: _selectedItem,
      borderRadius: BorderRadius.circular(10),
      items: widget.items.map((T item){
        return DropdownMenuItem<T>(
          value: item,
          child: Text(item.toString()),
        );
      },
      ).toList(),
      onChanged: (T? selectedItem) {
        if (selectedItem != null) {
          setState(() {
            _selectedItem = selectedItem;
          });
          widget.onChanged(selectedItem);
        }
      },
    );
  }
}
