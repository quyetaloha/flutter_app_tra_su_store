import 'package:flutter/material.dart';
import 'package:flutter_app_3/model/item.dart';
import 'package:flutter_app_3/providers/CartProvider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

//  List<Item> items = new List<Item>();

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Giỏ Hàng"),
      ),
      body: BodyLayout(cart),
      bottomSheet: Container(
          height: 60,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: BoxDecoration(
            color: Colors.teal,
//            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
            "Tổng giá: " + cart.getPrice().toString(),
            style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
            ),
          ),Icon(Icons.attach_money,color:Colors.white)
                ],
              ))),
    );
  }
}

class BodyLayout extends StatelessWidget {
  final Cart cart;

  BodyLayout(this.cart);

  @override
  Widget build(BuildContext context) {
    var items = cart.cartItems;
    return Container(
      child: Scrollbar(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Dismissible(
                secondaryBackground: null,
                background: Container(color: Colors.redAccent,),
                child: Container(
                  color: Colors.grey[200],
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(items[index].item.image),
                    ),
                    title: Container(
                        child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            items[index].item.title,
                          ),
                        ),
                        Container(
                          width: 270,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                  alignment: Alignment.bottomRight,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      height: 25,
                                      child: FloatingActionButton(
                                        heroTag: items[index].item.title + "2",
                                        onPressed: () {
                                          cart.decreaseAmountItem(
                                              items[index].item);
                                        },
                                        child: Icon(Icons.remove),
                                      ),
                                    ),
                                  )),
                              Container(
                                width: 30,
                                child: Center(
                                    child: Text(items[index].amount.toString())),
                              ),
                              Container(
                                height: 25,
                                child: FloatingActionButton(
                                  backgroundColor: Colors.teal,
                                  heroTag: items[index].item.title + "1",
                                  onPressed: () {
                                    cart.addItem(items[index].item);
                                  },
                                  child: Icon(Icons.add),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                  ),
                ),
                key: Key(items[index].item.id),
                onDismissed: (_) {
                  cart.deleteItem(items[index].item);
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text("Đã xóa khỏi giỏ hàng!"),));
                },
              ),
            );
          },
        ),
      ),
    );
    ;
  }
}

// replace this function with the code in the examples
