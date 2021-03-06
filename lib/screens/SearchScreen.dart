import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:saloon_app/models/TrendingStyles.dart';
import 'package:saloon_app/service/SearchService.dart';
import 'package:saloon_app/screens/StyleScreen.dart';
import 'package:saloon_app/service/StylesCategoriesService.dart';
import 'package:saloon_app/widgets/SearchResultCard.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search';


  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String inputText = "";
  List<TrendingStyles> mTrendingStylesSearchResultsList;

  @override
  void initState() {
    super.initState();
    mTrendingStylesSearchResultsList = getSearchResults();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      // This is handled by the search bar itself.
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Text("aaa"),
          Text("aaa"),
          Text("aaa"),
          Text("aaa"),
          Text("aaa"),
          Text("aaa"),
          Text("aaa"),
          buildFloatingSearchBar(),
        ],
      ),
    );
  }


  Widget buildFloatingSearchBar() {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        this.inputText = query;
        setState(() {

        });
        // inputText = query
        // Call your model, bloc, controller here.
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.place),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            // child: Column(
            //   mainAxisSize: MainAxisSize.min,
            //   children: mTrendingStylesSearchResultsList.map((searchResultItem) {
            //     return searchResultCardWidget(searchResultItem.image, searchResultItem.name, searchResultItem.price);
            //   }).toList(),
            // ),




            child: FutureBuilder<List<TrendingStyles>>(
                future: getATrendingStyleForSearch(this.inputText),
                builder: (BuildContext context,
                    AsyncSnapshot<List<TrendingStyles>> snapshot) {
                  List<Widget> children;
                  if (snapshot.hasData) {
                    children = <Widget>[
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      children: snapshot.data.map((searchResultItem) {
                        return GestureDetector(onTap: (){
                          // TrendingStyles ts =snapshot.data[index];
                          // TrendingStyles ts = searchResultItem.sty_id;

                          // Goto Style screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StyleScreen(styleId: searchResultItem.sty_id, prevCtx: context),
                            ),
                          );
                        }
                        , child: searchResultCardWidget(searchResultItem.image, searchResultItem.name, searchResultItem.price));
                      }).toList(),
                    ),

                  ];
                  } else if (snapshot.hasError) {
                    children = <Widget>[
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text('Error: ${snapshot.error}'),
                      )
                    ];
                  } else {
                    children = const <Widget>[
                      SizedBox(
                        child: CircularProgressIndicator(),
                        width: 60,
                        height: 60,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Awaiting result...'),
                      )
                    ];
                  }
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: children,
                    ),
                  );
                }),




          ),
        );
      },
    );
  }

}

// https://pub.dev/packages/material_floating_search_bar
