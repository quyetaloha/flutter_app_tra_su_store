import 'package:flutter/cupertino.dart';

class Item with ChangeNotifier{
  String id;
  String title;
  int price;
  String description;
  String image;
  bool isFavorite = true;

  Item(this.id, this.title,this.price, this.description, this.image,this.isFavorite);
  void toggleFavStatus(){
    this.isFavorite=!isFavorite;
    notifyListeners();
  }
}
