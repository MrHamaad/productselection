import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: false,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              "Product Selection"
          ),
          centerTitle: true,
          elevation: 5,
        ),
        body: ProductSelection(),
      ),
    );
  }
}

class ProductSelection extends StatefulWidget {
  const ProductSelection({super.key});

  @override
  State<ProductSelection> createState() => _ProductSelectionState();
}

class _ProductSelectionState extends State<ProductSelection> {
  String? _selectedCategory = "Electronics";
  final List<String> items = [
    "Electronics",
    "Books",
    "Clothing"
  ];
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
        Text("Choose a Category."),
        DropdownButton(
            items: items.map((item)=>
               DropdownMenuItem(
                value: item,
                child: Text(item),
            )
            ).toList(),
            value: _selectedCategory,
            onChanged: (String? category){
              setState(() {
                _selectedCategory = category;
              });
        }),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white
                ),
                onPressed: (){},
                child: Text("View Detail")
            ),
            const SizedBox(width: 5,),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white
                ),
                onPressed: (){},
                child: Text("Buy Now")
            ),
          ],
        )
      ],
      )
    );
  }
}
