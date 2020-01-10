import 'package:flutter/cupertino.dart';

import 'item.dart';

class CartItem with ChangeNotifier{
  Item item;
  int amount;
  CartItem(this.item, this.amount);

}
