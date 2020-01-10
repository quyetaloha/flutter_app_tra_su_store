import 'package:flutter/material.dart';
import 'package:flutter_app_3/model/item.dart';
import 'package:flutter_app_3/providers/CartProvider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

//  List<Item> items = new List<Item>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giỏ Hàng"),
      ),
      body: BodyLayout(),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var items = Provider.of<Cart>(context).cartItems;
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(items[index].item.image),
          ),
          title: Container(
              child: Row(
            children: <Widget>[
              Container(

                child: Text(items[index].item.title,),
              ),
              Container(
                width: 200,
                child: Center(child: Text(items[index].amount.toString())),
              ),
              Container(
                  alignment: Alignment.bottomRight,
                  child: Align(

                    alignment: Alignment.centerRight,
                    child: FloatingActionButton(
                      heroTag: items[index].item.id,
                      onPressed: () {},
                      child: Icon(Icons.remove),
                    ),
                  )),
            ],
          )),
        );
      },
    );
    ;
  }
}

// replace this function with the code in the examples
