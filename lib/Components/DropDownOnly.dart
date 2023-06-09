import 'package:flutter/material.dart';

class DropDownOnly<T> extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF8F8F6), // Use the same background color as the DropdownButton
          borderRadius: BorderRadius.circular(4.0), // Customize the border radius if needed
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: DropdownButton<T>(
          value: selectedItem,
          onChanged: onChanged,
          underline: SizedBox(), // Remove the underline
          style: Theme.of(context).textTheme.bodyLarge, // Customize the text style if needed
          items: items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(item.toString()),
            );
          }).toList(),
        ),
      ),
    );
  }
}
