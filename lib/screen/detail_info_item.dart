import 'package:flutter/material.dart';
import 'package:flutter_app_3/model/item.dart';
import 'package:flutter_app_3/providers/CartProvider.dart';
import 'package:flutter_app_3/providers/RecentItemView.dart';
import 'package:provider/provider.dart';

class DetailItem extends StatelessWidget {
  static const routeName = '/item-detail';

  @override
  Widget build(BuildContext context) {
    var item = ModalRoute.of(context).settings.arguments as Item;
    var recentitems = Provider.of<RecentViewItems>(context);
    var cart = Provider.of<Cart>(context);
    recentitems.addRecentViewItem(item);
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin sản phẩm"),
      ),
      body: Builder(
        builder: (context)=> Center(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                color: Colors.amber[600],
                child: Center(child: Image.network(item.image)),
              ),
              Container(
                  child: Center(
                      child: Text(item.title,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)))),
              Container(child: Text('''
              Dữ dội và dịu êm
              Ồn ào và lặng lẽ
              Sông không hiểu nổi mình
              Sóng tìm ra tận bể
              
              Ôi con sóng ngày xưa
              Và ngày sau vẫn thế
              Nỗi khát vọng tình yêu
              Bồi hồi trong ngực trẻ
              
              Trước muôn trùng sóng bể
              Em nghĩ về anh, em
              Em nghĩ về biển lớn
              Từ nơi nào sóng lên?
              
              Sóng bắt đầu từ gió
              Gió bắt đầu từ đâu?
              Em cũng không biết nữa
              Khi nào ta yêu nhau
              ''')),
              Container(
                child: FloatingActionButton(
                  child: Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    cart.addItem(item);
                    print("hihi");
                    Scaffold.of(context).hideCurrentSnackBar();
                    Scaffold.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.teal[400],
                      content: Text(
                        "Đã thêm vào giỏ hàng! Số lượng: " +
                            cart.getCartItem(item).amount.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),
                      ),
                    ),);
                  },
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}