import 'package:flutter/material.dart';
import 'package:flutter_app_3/model/item.dart';
import 'package:flutter_app_3/providers/RecentItemView.dart';
import 'package:provider/provider.dart';

class DetailItem extends StatelessWidget {
  static const routeName = '/item-detail';
  @override
  Widget build(BuildContext context) {
    var item = ModalRoute.of(context).settings.arguments as Item;
    var recentitems = Provider.of<RecentViewItems>(context);
    recentitems.addRecentViewItem(item);
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              color: Colors.amber[600],
              child: Center(child: Image.network(item.image)),
            ),
            Container(
                child: Center(
                    child: Text("Trà sửa chân châu: " + item.id.toString(),
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
                onPressed: () {},
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}