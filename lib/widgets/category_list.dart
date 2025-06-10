import 'package:flutter/material.dart';

class GategorySelection extends StatefulWidget {
  final Function(List<String>)? onCategorySelected;
  const GategorySelection({super.key, required this.onCategorySelected});

  @override
  State<GategorySelection> createState() => _GategorySelectionState();
}

class _GategorySelectionState extends State<GategorySelection> {
  String? _selectedCategory = "Electronics";
  final List<String> categories = ["Electronics", "Books", "Clothing"];
  final List<Map<String, dynamic>> items = [
    {
      "category": "Electronics",
      "items": ["Laptop", "Mobile", "Tablet"],
    },
    {
      "category": "Books",
      "items": ["Cosmic", "Science", "History"],
    },
    {
      "category": "Clothing",
      "items": ["Shirt", "Jeans", "Shoes"]
    },
  ];

  List<String> getFilteredItems() {
    if (_selectedCategory == null) return [];
    final categoryData = items.firstWhere(
          (element) => element["category"] == _selectedCategory,
      orElse: () => {"items": []},
    );
    return List<String>.from(categoryData["items"]);
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: FittedBox(
            child: Text(
              "Choose a Category.",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              items: categories.map(
                (item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ).toList(),
              value: _selectedCategory,
              onChanged: (String? category) {
                setState(() {
                  _selectedCategory = category;
                });
                if(widget.onCategorySelected!=null){
                  widget.onCategorySelected!(getFilteredItems());
                }
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              child: Text("View Detail"),
            ),
            const SizedBox(width: 5),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              child: Text("Buy Now"),
            ),
          ],
        ),
      ],
    );
  }
}
