import 'package:flutter/material.dart';
import 'package:mypractice/widgets/category_list.dart';
import 'package:mypractice/widgets/item_selection.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  List<Map<String, dynamic>> items = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(15), // Fixed: EdgeInsetsGeometry.all to EdgeInsets.all
      decoration: const BoxDecoration(
        color: Colors.blueGrey,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          GategorySelection(
            onCategorySelected: (filteredItems) {
              setState(() {
                items = filteredItems;
              });
            },
          ),
          ItemSelection(items),
        ],
      ),
    );
  }
}