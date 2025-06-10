import 'package:flutter/material.dart';
import 'package:mypractice/widgets/category_list.dart';
import 'package:mypractice/widgets/item_selection.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsetsGeometry.all(10),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
        ),
        child: Column(
            children: [
              GategorySelection(
                onCategorySelected: (filteredItems) => print("Category Selected"),
              ),
              ItemSelection(),
            ]
        )
    );
  }
}