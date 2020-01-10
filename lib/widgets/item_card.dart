import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_3/model/item.dart';
import 'package:flutter_app_3/providers/CartProvider.dart';
import 'package:flutter_app_3/screen/detail_info_item.dart';
import 'package:provider/provider.dart';

//import 'package:flutter/material.dart';
//import 'package:flutter_app_3/model/item.dart';
//import 'package:flutter_app_3/screen/detail_info_item.dart';
//import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget with ChangeNotifier{
//  Item item;
//
//  ItemCard({
//    Key key,
//    @required this.item,
//  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cart=Provider.of<Cart>(context);
    var item=Provider.of<Item>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        header: Center(child: Text("hihi")),
        child: GestureDetector(
          onTap: () => {
            Navigator.pushNamed(context, DetailItem.routeName,
                arguments: item)
          },
          child: new Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              border:
              Border.all(color: Colors.teal, width: 2),
            ),
            child: Image.network(
              "https://cdn.myxteam.com/uploads/tong-quan/khach-hang/tocotoco/Screen_Shot_2018-08-09_at_5.28.32_PM.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.grey[300],
          title: Container(
            child:
            Center(
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: item.title, style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 18)),
                  ],
                ),
              ),
            )


          ),
          leading: IconButton(
            icon: Icon(item.isFavorite?Icons.favorite:Icons.favorite_border),
            color: Theme.of(context).accentColor,
            onPressed: () {
              item.toggleFavStatus();
              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(SnackBar(content: Text(item.isFavorite?"đã thêm vào danh sách theo dõi":"đã loại bỏ danh sách theo dõi"),));
            },
          ),
          trailing: IconButton(
            icon: Badge(
              padding: EdgeInsets.all(6.0),
              child: Icon(Icons.shopping_cart),
              badgeContent: Text(
                cart.getCartItem(item)!=null?cart.getCartItem(item).amount.toString():"+",
                style: TextStyle(color: Colors.white,fontSize: 10),
              ),
              badgeColor: Colors.black,
              animationType: BadgeAnimationType.slide,
              animationDuration: Duration(milliseconds: 50),
              shape: BadgeShape.circle,
            ),
            color: Theme.of(context).accentColor,
            onPressed: () {
              cart.addItem(item);
              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(SnackBar(content: Text("đã thêm vào giỏ hàng! Số lượng: "+cart.getCartItem(item).amount.toString()),));
            },
          ),
        ),
      ),
    );
  }
}
