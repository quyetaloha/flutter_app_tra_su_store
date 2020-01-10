import 'package:flutter/cupertino.dart';
import 'package:flutter_app_3/model/CartItemModel.dart';
import 'package:flutter_app_3/model/item.dart';

class Cart with ChangeNotifier {
  List<CartItem> _cartItems=[
  ];

  List<CartItem> get cartItems {
    return [..._cartItems];
  }

  void deleteItem(String id){
    _cartItems.removeWhere((element)=>element.item.id==id);
    notifyListeners();
  }
  int getPrice(){
    int total=0;
    _cartItems.forEach((item)=>{
      total+=item.item.price
    });
    return total;
  }

  void addItem(Item item){
    var a=_cartItems.firstWhere((element)=>element.item.id==item.id, orElse: () => null);
    if (a!=null){
      a.amount+=1;
    }
    else
      _cartItems.add(new CartItem(item, 1));
    notifyListeners();
  }
  CartItem getCartItem(Item item){
    return _cartItems.firstWhere((element)=>element.item.id==item.id, orElse: () => null);
  }
}
