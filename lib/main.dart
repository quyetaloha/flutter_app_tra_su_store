import 'package:flutter/material.dart';
import 'package:flutter_app_3/providers/CartProvider.dart';
import 'package:flutter_app_3/providers/RecentItemView.dart';
import 'package:flutter_app_3/screen/home_list_item.dart';
import 'package:flutter_app_3/screen/user_cart.dart';
import 'package:flutter_app_3/widgets/item_card.dart';
import 'package:provider/provider.dart';
import 'providers/Items.dart';
import 'widgets/app_drawer.dart';
import 'model/item.dart';
import 'screen/detail_info_item.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final title = 'MT Store';
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
            value: Items()
        ),
        ChangeNotifierProvider.value(
            value: HomeListItem(false)
        ),
//        ChangeNotifierProvider.value(
//            value: ItemCard(item:null),
//        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: RecentViewItems(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          accentColor: Colors.red,
          fontFamily: 'Lato',
        ),
        title: title,
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          // When navigating to the "/second" route, build the SecondScreen widget.
          DetailItem.routeName: (context) => DetailItem(),
          CartScreen.routeName: (context) => CartScreen(),
        },
        home: HomeListItem(false),
      ),
    );
  }
}
