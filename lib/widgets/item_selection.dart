import 'package:flutter/material.dart';

class ItemSelection extends StatefulWidget {
  const ItemSelection({super.key});

  @override
  State<ItemSelection> createState() => _ItemSelectionState();
}

class _ItemSelectionState extends State<ItemSelection> {
  String? _selectedItem = "Electronics";
  final List<String> Items = [
    "Electronics",
    "Books",
    "Clothing"
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: FittedBox(
              child: Text(
                "Choose a Category.",
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium,
              ),
            )),
        const SizedBox(height: 10,),
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
                items: Items.map((item) =>
                    DropdownMenuItem(
                      value: item,
                      child: Text(item, style: Theme
                          .of(context)
                          .textTheme
                          .displayMedium,),
                    )
                ).toList(),
                value: _selectedItem,
                onChanged: (String? category) {
                  setState(() {
                    _selectedItem = category;
                  });
                }),
          ),
        ),
      ],
    );
  }
}
