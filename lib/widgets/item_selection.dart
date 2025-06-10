
import 'package:flutter/material.dart';

class ItemSelection extends StatefulWidget {
  final List<Map<String, dynamic>> items;

  const ItemSelection(this.items, {super.key});

  @override
  State<ItemSelection> createState() => _ItemSelectionState();
}

class _ItemSelectionState extends State<ItemSelection> {
  Map<String, dynamic>? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: FittedBox(
            child: Text(
              "Choose a Item.",
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
            child: DropdownButton<Map<String, dynamic>>(
              isExpanded: true,
              items: widget.items.map((item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item["name"],
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              )).toList(),
              hint: Text("Select an Item", style: Theme.of(context).textTheme.displayMedium),
              value: _selectedItem,
              onChanged: widget.items.isEmpty ? null : (Map<String, dynamic>? item) {
                setState(() {
                  _selectedItem = item;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: _selectedItem == null ? null : () {
                _showItemDetail(context, _selectedItem!);
              },
              child: const Text("View Detail"),
            ),
            const SizedBox(width: 5),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: _selectedItem == null ? null : () {
                _buyItem(context, _selectedItem!);
              },
              child: const Text("Buy Now"),
            ),
          ],
        ),
      ],
    );
  }

  void _showItemDetail(BuildContext context, Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(item["name"]),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("\$${item["price"].toStringAsFixed(2)}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(item["description"]),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  void _buyItem(BuildContext context, Map<String, dynamic> item) {
    // Implement your buy logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Purchased ${item["name"]} for \$${item["price"].toStringAsFixed(2)}")),
    );
  }
}