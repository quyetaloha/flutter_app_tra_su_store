import 'package:flutter/cupertino.dart';
import 'package:flutter_app_3/model/CartItemModel.dart';
import 'package:flutter_app_3/model/item.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_3/model/item.dart';

class RecentViewItems with ChangeNotifier {
  final amount=10;
  List<Item> _items = [
  ];

  List<Item> get items {
    return [..._items];
  }

  Item findById(String id){
    return _items.firstWhere((element)=>element.id==id);
  }
  void deleteItem(String id){
    _items.removeWhere((element)=>element.id==id);
    notifyListeners();
  }
  int getLengthSize(){
    return _items.length;
  }
  void addRecentViewItem(Item item){
    var a=_items.firstWhere((element)=>element==item, orElse: () => null);
    if (a!=null)
      return;
    if (_items.length<amount)
      _items.add(item);
    else{
      _items.removeLast();
      _items.add(item);
    }
    notifyListeners();
  }
}

