import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:saloon_app/models/TrendingStyles.dart';
import 'package:saloon_app/widgets/CustomTextWidget.dart';
import 'package:saloon_app/enum/SortByItem.dart';
import 'package:saloon_app/service/StylesCategoriesService.dart';
import 'package:saloon_app/utils/globals.dart';


class ShowSortingDialog extends StatefulWidget {

  final String interfaceType;
  final String selectedCategory;

  ShowSortingDialog({Key key, this.interfaceType, this.selectedCategory}) : super(key: key);


  @override
  _ShowSortingDialogState createState() => _ShowSortingDialogState();
}

class _ShowSortingDialogState extends State<ShowSortingDialog> {

  String interfaceType;
  String selectedCategory;

  String get t {
    return interfaceType;
  }

  String get sc {
    return selectedCategory;
  }

  @override
  void initState() {
    super.initState();
    this.interfaceType = widget.interfaceType;
    this.selectedCategory = widget.selectedCategory;
    this.sortingTypeFunc();
  }

  SortByItem radioItem;

  void sortingTypeFunc() {
    if(this.interfaceType == "sortCategory"){

      this.radioItem = (gblSelectedType_sortCategory=="best_match")? SortByItem.best_match :
      (gblSelectedType_sortCategory=="name")? SortByItem.name:
      (gblSelectedType_sortCategory=="price_ascending")? SortByItem.price_ascending:
      (gblSelectedType_sortCategory=="price_descending")? SortByItem.price_descending:
      SortByItem.best_match;

    }else{
      //sortStyle

      this.radioItem = (gblSelectedType_sortStyle=="best_match")? SortByItem.best_match :
      (gblSelectedType_sortStyle=="name")? SortByItem.name:
      (gblSelectedType_sortStyle=="price_ascending")? SortByItem.price_ascending:
      (gblSelectedType_sortStyle=="price_descending")? SortByItem.price_descending:
      SortByItem.best_match;

    }
  }




  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    padding: EdgeInsets.all(16),
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.close, color: Colors.black)),
              ),
              customTextWidget("Sort By",
                  textColor: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0),
              SizedBox(height: 10),
              ListTile(
                title: const Text('Best Match'),
                leading: Radio<SortByItem>(
                  value: SortByItem.best_match,
                  groupValue: radioItem,
                  onChanged: (SortByItem value) {
                    setState(() {
                      radioItem = value;
                    });

                    print(value);
                  },
                ),
              ),

              ListTile(
                title: const Text('Name'),
                leading: Radio<SortByItem>(
                  value: SortByItem.name,
                  groupValue: radioItem,
                  onChanged: (SortByItem value) {
                    setState(() {
                      radioItem = value;
                    });

                    print(value);
                  },
                ),
              ),

              ListTile(
                title: const Text('Price (Ascending)'),
                leading: Radio<SortByItem>(
                  value: SortByItem.price_ascending,
                  groupValue: radioItem,
                  onChanged: (SortByItem value) {
                    setState(() {
                      radioItem = value;
                    });

                    print(value);
                  },
                ),
              ),

              ListTile(
                title: const Text('Price (Descending)'),
                leading: Radio<SortByItem>(
                  value: SortByItem.price_descending,
                  groupValue: radioItem,
                  onChanged: (SortByItem value) {
                    setState(() {
                      radioItem = value;
                    });

                    print(value);
                  },
                ),
              ),



              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  GestureDetector(
                    onTap: (){

                      print(radioItem);

                      String selectedType ="";
                      switch (radioItem) {
                        case SortByItem.best_match:
                          selectedType="best_match";
                          break;
                        case SortByItem.name:
                          selectedType="name";
                          break;
                        case SortByItem.price_ascending:
                          selectedType="price_ascending";
                          break;
                        case SortByItem.price_descending:
                          selectedType="price_descending";
                          break;
                        default:
                          selectedType="best_match";
                      }

                      if(interfaceType  == "sortStyle"){
                        gblSortedData_sortStyle = getSortedTrendingResults_sortStyle(selectedType);
                        gblSelectedType_sortStyle = selectedType;
                      }else if(interfaceType  == "sortCategory"){
                        gblSortedData_sortCategory = getSortedTrendingResults_sortCategory(selectedType, selectedCategory);
                        gblSelectedType_sortCategory = selectedType;
                      }


                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.all(16),
                      padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                      decoration: new BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      alignment: Alignment.center,
                      child: customTextWidget("Sort",
                          textColor: Colors.white, fontSize: 20.0),
                    ),
                  )
                ],
              ),
            ],
          ))
    );
  }


}

showSortingDialogContent(BuildContext context, _character) {
  return ;
}
