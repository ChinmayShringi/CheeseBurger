import 'package:cheeseburger/routing/good_purchase_routing.dart';
import 'package:flutter/material.dart';
import 'package:cheeseburger/screens/product_screen.dart';

class HomeSearch extends StatefulWidget {
  final List goods;
  @override
  HomeSearch({Key key,@required this.goods}): super(key:key);
 _HomeSearchPageState createState() => new _HomeSearchPageState();
}

class _HomeSearchPageState extends State<HomeSearch> {
  @override
  void initState() {
    super.initState();
    this.goods=this.widget.goods;
  }
  _HomeSearchPageState(){
      _filter.addListener(() {
        if (_filter.text.isEmpty) {
          setState(() {
            _searchText = "";
            filteredNames = names;
          });
        } else {
          setState(() {
            _searchText = _filter.text;
          });
        }
      });
  }
  List goods;
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  List names = new List();
  List filteredNames = new List();
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text( 'Search Goods',style: TextStyle(
    color: Colors.white
  ), );

  @override
  Widget build(BuildContext context) {
      if (this.goods == null) {
        return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.search,
                  color: Colors.black54,
                  size: 30,
                ),
                Text("Connecting to server!", style: TextStyle(
                    fontSize: 30
                ),)
              ],
            )
        );
      } else {
        this._getNames();
        return Scaffold(
          appBar: _buildBar(context),
          body: Container(
            child: _buildList(),
          ),
          resizeToAvoidBottomPadding: false,
        );
      }
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,

      ),
    );
  }

  Widget _buildList() {
    if ((_searchText.isNotEmpty)) {
      List tempList = new List();
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]['name'].toLowerCase().contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
            title: Text(filteredNames[index]['name'], style: TextStyle(
                color: Colors.black54
            ),),
            onTap: () =>
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductScreen(product: filteredNames[index],),
                ),
              ),
            }
        );
      }
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          autofocus: true,
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search),
              hintText: 'Search...'
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text( 'Search Goods',style: TextStyle(color: Colors.white), );
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  void _getNames() {
    List tempList = new List();
    for (int i = 0; i < this.goods.length; i++) {
      tempList.add(this.goods[i]);
    }
    setState(() {
      names = tempList;
      filteredNames = names;
    });
  }
}
