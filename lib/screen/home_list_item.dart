import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_3/model/item.dart';
import 'package:flutter_app_3/providers/Items.dart';
import 'package:flutter_app_3/providers/RecentItemView.dart';
import 'package:flutter_app_3/widgets/app_bar.dart';
import 'package:flutter_app_3/widgets/app_drawer.dart';
import 'package:flutter_app_3/widgets/grid-item.dart';
import 'package:flutter_app_3/widgets/item_card.dart';
import 'package:provider/provider.dart';

class HomeListItem extends StatefulWidget with ChangeNotifier {
  bool isShowFavourite;

  HomeListItem(this.isShowFavourite);

  showFavourite(isShowFavourite) {
    this.isShowFavourite=isShowFavourite;
    notifyListeners();
  }
  bool get getfavorite{
    return this.isShowFavourite;
  }

  @override
  _HomeListItem createState() => _HomeListItem();
}


class _HomeListItem extends State<HomeListItem> {
  bool isShowFavourite;

  @override
  void initState() {
    isShowFavourite = widget.isShowFavourite;
  }

  @override
  Widget build(BuildContext context) {
    var isFavourite=Provider.of<HomeListItem>(context).getfavorite;
    var items=isFavourite?Provider.of<Items>(context).filterFavItems:Provider.of<Items>(context).items;
    var recentitems = Provider.of<RecentViewItems>(context);
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBarHome(),
        drawer: AppDrawer(),
        body: Scrollbar(
            controller:ScrollController(initialScrollOffset:50.0,keepScrollOffset:false,
            ),
          child: Container(
            margin: EdgeInsets.all(0),
            child: TabBarView(
              children: <Widget>[
                Builder(
                  builder: (context) => Container(
                    height: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: CustomScrollView(
                      slivers: <Widget>[
                        SliverAppBar(
                          automaticallyImplyLeading: false,
                          backgroundColor: Colors.teal[200],
                          stretch: true,
                          flexibleSpace: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: items.length,
                              itemBuilder: (_, index) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.white70, width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.network('${items[index].image}'),
                                );
                              }),
                          expandedHeight: 200,
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            height: recentitems.items.length>0?100:5,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: recentitems.items.length,
                                itemBuilder: (_, index) {
                                  return Container(

                                      padding: const EdgeInsets.all(5),
                                  child:Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      border:
                                      Border.all(color: Colors.teal, width: 2),
                                    ),
                                    child: GridTile(
                                      child: Image.network('${recentitems.items[index].image}',fit: BoxFit.cover,),
                                      footer: Container(color:Colors.grey[300],child: Center(child: Text(recentitems.items[index].title))),
                                    ),
                                  ),
                                    width: 100,
                                    color: Colors.white10,
                                  );
                                }),
                          ),
                        ),
                        SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
//                            return ItemCard(item: items[index]);
                              return ChangeNotifierProvider.value(
                                value:items[index],
                                child: ItemCard(),
                              );
                            },
                            childCount: items.length,
                          ),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200.0,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 20.0,
                            childAspectRatio: 1,
                            // childAspectRatio: .0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Container(
                    color: Colors.grey,
                    child: TabBar(
                      tabs: <Widget>[
                        Tab(icon: Icon(Icons.home)),
                        Tab(icon: Icon(Icons.new_releases)),
                        Tab(icon: Icon(Icons.info)),
                      ],
                    ),
                  ),
                ),
                Text("hihi")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
