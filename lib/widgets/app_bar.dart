import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_3/providers/CartProvider.dart';
import 'package:flutter_app_3/screen/home_list_item.dart';
import 'package:flutter_app_3/screen/user_cart.dart';
import 'package:provider/provider.dart';

import 'grid-item.dart';

class AppBarHome extends StatelessWidget with PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    var homeListView=Provider.of<HomeListItem>(context);
    var cart=Provider.of<Cart>(context);
    return AppBar(
      backgroundColor: Colors.teal,
      title: Text("MT Store"),
      actions: <Widget>[
        PopupMenuButton(
          onSelected: (int a) {
            if (a == 1) {
              homeListView.showFavourite(true);
            };
            if (a == 2) {
              homeListView.showFavourite(false);
            };
          },
          tooltip: "Lọc ",
          icon: Icon(Icons.keyboard_arrow_down),
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(
              textStyle:new TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
              child: Text("SP đang theo dõi"),
              value: 1,
            ),
            PopupMenuItem(
              textStyle:new TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
              child: Text("Tất cả"),
              value: 2,
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 15, 15, 0),
          child: GestureDetector(
            onTap: ()=>{
            Navigator.pushNamed(context, CartScreen.routeName)
            },
            child: Badge(
              padding: EdgeInsets.all(6.0),
              child: Icon(Icons.shopping_cart),
              badgeContent: Text(
                cart.cartItems.length.toString(),
                style: TextStyle(color: Colors.white),
              ),
              badgeColor: Colors.red,
              animationType: BadgeAnimationType.scale,
              animationDuration: Duration(milliseconds: 500),
              shape: BadgeShape.circle,
            ),
          ),
        ),
      ],
      bottom: TabBar(
        tabs: <Widget>[
          Tab(icon: Icon(Icons.home)),
          Tab(icon: Icon(Icons.new_releases)),
          Tab(icon: Icon(Icons.info)),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(90);
}
