import 'package:flutter/material.dart';

class GategorySelection extends StatefulWidget {
  final Function(List<Map<String, dynamic>>)? onCategorySelected;
  const GategorySelection({super.key, required this.onCategorySelected});

  @override
  State<GategorySelection> createState() => _GategorySelectionState();
}

class _GategorySelectionState extends State<GategorySelection> {
  String? _selectedCategory;

  final List<String> categories = ["Electronics", "Books", "Clothing"];
  final List<Map<String, dynamic>> items = [
    {
      "category": "Electronics",
      "items": [
        {
          "name": "Laptop",
          "price": 999.99,
          "description": "High-performance laptop with 16GB RAM",
          // "image": "assets/laptop.png"
        },
        {
          "name": "Mobile",
          "price": 699.99,
          "description": "Latest smartphone with 5G support",
          // "image": "assets/mobile.png"
        },
        {
          "name": "Smartwatch",
          "price": 199.99,
          "description": "Fitness tracker with heart rate monitoring",
          // "image": "assets/smartwatch.png"
        },
        {
          "name": "Headphones",
          "price": 99.99,
          "description": "Wireless headphones with noise cancellation",
          // "image": "assets/headphones.png"
        },
        {
          "name": "Tablet",
          "price": 499.99,
          "description": "Portable tablet with 10-inch display",
          // "image": "assets/tablet.png"
        },
      ],
    },
    {
      "category": "Books",
      "items": [
        {
          "name": "The Alchemist",
          "price": 14.99,
          "description": "A novel by Paulo Coelho",
          // "image": "assets/alchemist.png"
        },
        {
          "name": "To Kill a Mockingbird",
          "price": 12.99,
          "description": "A classic novel by Harper Lee",
          // "image": "assets/mockingbird.png"
        },
        {
          "name": "The Hunger Games",
          "price": 16.99,
          "description": "A dystopian novel by Suzanne Collins",
          // "image": "assets/hungergames.png"
        },
        {
          "name": "Pride and Prejudice",
          "price": 10.99,
          "description": "A romantic novel by Jane Austen",
          // "image": "assets/prideprejudice.png"
        },
        {
          "name": "The Lord of the Rings",
          "price": 24.99,
          "description": "A fantasy novel by J.R.R. Tolkien",
          // "image": "assets/lordoftherings.png"
        },
      ],
    },
    {
      "category": "Clothing",
      "items": [
        {
          "name": "T-Shirt",
          "price": 19.99,
          "description": "Casual t-shirt for men",
          // "image": "assets/tshirt.png"
        },
        {
          "name": "Jeans",
          "price": 49.99,
          "description": "Slim-fit jeans for men",
          // "image": "assets/jeans.png"
        },
        {
          "name": "Dress",
          "price": 39.99,
          "description": "Casual dress for women",
          // "image": "assets/dress.png"
        },
        {
          "name": "Jacket",
          "price": 69.99,
          "description": "Leather jacket for men",
          // "image": "assets/jacket.png"
        },
        {
          "name": "Sneakers",
          "price": 59.99,
          "description": "Running shoes for men",
          // "image": "assets/sneakers.png"
        },
      ],
    },
  ];


  List<Map<String, dynamic>> getFilteredItems() {
    if (_selectedCategory == null) return [];
    final categoryData = items.firstWhere(
          (element) => element["category"] == _selectedCategory,
      orElse: () => {"items": []},
    );
    return List<Map<String, dynamic>>.from(categoryData["items"]);
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
              hint: Text("Select a Category", style: Theme.of(context).textTheme.displayMedium,),
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

      ],
    );
  }
}
