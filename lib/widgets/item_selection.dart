import 'package:flutter/material.dart';
import 'buy_item_drawer.dart';
import 'item_detail_drawer.dart';

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
          padding: const EdgeInsets.all(10),
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
    Scaffold.of(context).openEndDrawer();
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return ItemDetailDrawer(item: item);
        },
      ),
    );
  }

  void _buyItem(BuildContext context, Map<String, dynamic> item) {
    Scaffold.of(context).openEndDrawer();
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return BuyItemDrawer(
            item: item,
            onPurchaseComplete: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Purchased ${item["name"]} for \$${item["price"].toStringAsFixed(2)}"),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}