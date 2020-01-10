import 'package:flutter/material.dart';
import 'package:flutter_app_3/model/item.dart';
import 'item_card.dart';

class GridHomeItem extends StatelessWidget {
  List<Item> items = new List<Item>();

  GridHomeItem (this.items);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 700,
          color: Colors.white12,
          child: GridView.count(
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 2,
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            // Generate 100 widgets that display their index in the List.
            children: List.generate(items.length, (index) {
//              return ItemCard(item: items[index],);
            }),
          ),
        ),
      ],
    );
  }
}

