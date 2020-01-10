import 'package:flutter/cupertino.dart';
import 'package:flutter_app_3/model/item.dart';

class Items with ChangeNotifier {
  List<Item> _items = [
    new Item("1", "tra sua 1",1000, "description",
        "https://file.hstatic.net/1000360860/file/56.1_8fc931e9ecee47cc8a3cd90331c9bb2b_grande.png",true),
    new Item("2", "tra sua 2",1000, "description",
        "https://file.hstatic.net/1000360860/file/56.1_8fc931e9ecee47cc8a3cd90331c9bb2b_grande.png",false),
    new Item("3", "tra sua 3",1000, "description",
        "https://file.hstatic.net/1000360860/file/56.1_8fc931e9ecee47cc8a3cd90331c9bb2b_grande.png",false),
    new Item("4", "tra sua 4",1000, "description",
        "https://file.hstatic.net/1000360860/file/56.1_8fc931e9ecee47cc8a3cd90331c9bb2b_grande.png",false),
    new Item("5", "tra sua 5",1000, "description",
        "https://file.hstatic.net/1000360860/file/56.1_8fc931e9ecee47cc8a3cd90331c9bb2b_grande.png",false),
    new Item("6", "tra sua 6",1000, "description",
        "https://file.hstatic.net/1000360860/file/56.1_8fc931e9ecee47cc8a3cd90331c9bb2b_grande.png",false),
    new Item("7", "tra sua 7",1000, "description",
        "https://file.hstatic.net/1000360860/file/56.1_8fc931e9ecee47cc8a3cd90331c9bb2b_grande.png",false),
    new Item("8", "tra sua 8",1000, "description",
        "https://file.hstatic.net/1000360860/file/56.1_8fc931e9ecee47cc8a3cd90331c9bb2b_grande.png",true),
    new Item("9", "tra sua 9",1000, "description",
        "https://file.hstatic.net/1000360860/file/56.1_8fc931e9ecee47cc8a3cd90331c9bb2b_grande.png",true),
  ];

  List<Item> get items {
    return [..._items];
  }

  List<Item> get filterFavItems{
    return _items.where((item)=>item.isFavorite).toList();
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
}
