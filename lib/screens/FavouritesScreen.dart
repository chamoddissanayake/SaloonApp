import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saloon_app/service/FavouriteService.dart';
import 'package:saloon_app/widgets/AppBarWidget.dart';
import 'package:saloon_app/widgets/MainDrawer.dart';
import 'package:saloon_app/widgets/LocationsFloatingActionWidget.dart';
import 'package:saloon_app/models/Favourite.dart';

import 'package:flutter/material.dart';

/*
* Bandara A.B.C.N
* IT18117356
* Favourite Screen
*/

class FavouritesScreen extends StatefulWidget {
  static const routeName = '/favourites';
  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  var _favouriteItems = <Favourite>[];
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshFavourites();
    // WidgetsBinding.instance.addPostFrameCallback((_) => refreshFavourites());
  }

  Future refreshFavourites() async {
    setState(() {
      isLoading = true;
    });

    this._favouriteItems = await FavouriteService.readFavourites();

    setState(() {
      isLoading = false;
    });
  }

  Widget _buildList() {
    return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        itemCount: _favouriteItems.length,
        itemBuilder: (BuildContext context, int item) {
          final index = item ~/ 2;
          return _BuildRow(_favouriteItems[index]);
        });
  }

  Widget _BuildRow(Favourite item) {
    return ListTile(
      title: Text(item.title, style: TextStyle(fontSize: 18.0)),
      trailing: Icon(Icons.delete),
      onTap: () {
        FavouriteService.deleteTodo(item);
        _favouriteItems.remove(item);
        refreshFavourites();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // getFavourites();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBarWidget(),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(child: MainDrawer()),
      ),
      body: isLoading
          ? Text('Loading.....')
          : FutureBuilder<List<Favourite>>(
              future: FavouriteService.readFavourites(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Favourite>> snapshot) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: _favouriteItems.length,
                    itemBuilder: (context, index) {
                      return _BuildRow(_favouriteItems[index]);
                    });
              },
            ),
      floatingActionButton: LocationsFloatingActionWidget(),
    );
  }
}
