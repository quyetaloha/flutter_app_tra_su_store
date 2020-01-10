import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Builder(
        builder: (context) => ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://docmiendatnuoc.com/wp-content/uploads/2019/07/hoa-sen-vn-1.jpg"),
                  fit: BoxFit.cover,
                ),
                color: Colors.blue,
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'MT Store',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://docmiendatnuoc.com/wp-content/uploads/2019/07/hoa-sen-vn-1.jpg'),
              ),
              title: Text('Tài khoản'),
            ),
            new ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Giỏ hàng'),
              onTap: () {
                Navigator.of(context).pushNamed('/cart', arguments: 1);
              },
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Phản hồi'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Cài đặt'),
            ),
          ],
        ),
      ),
    );
  }

}