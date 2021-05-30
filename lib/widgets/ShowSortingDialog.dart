import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:saloon_app/widgets/CustomTextWidget.dart';
import 'package:saloon_app/widgets/PaymentDialog.dart';
import 'package:saloon_app/enum/SortByItem.dart';
import 'package:saloon_app/service/StylesCategoriesService.dart';


class ShowSortingDialog extends StatefulWidget {
  @override
  _ShowSortingDialogState createState() => _ShowSortingDialogState();
}

class _ShowSortingDialogState extends State<ShowSortingDialog> {
  SortByItem radioItem = SortByItem.best_match;

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


                      // TODO: refresh data of all trending styles screen from here
                      getSortedTrendingResults(selectedType);
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
