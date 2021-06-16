import 'package:flutter/material.dart';

/*
* Bandara A.B.C.N
* IT18117356
* Favourite Model
*/

class Favourite {
  // attributes
  String id;
  String title;
  String user_id;
  String style_id;

  // constructor
  Favourite(
      {this.id,
      @required this.title,
      @required this.user_id,
      @required this.style_id});

  // convert class attribute values into json format
  Map<String, dynamic> toJson() => {
        'id': this.id,
        'user_id': this.user_id,
        'style_id': this.style_id,
        'title': this.title
      };

  // convert json to Favourite object
  static Favourite fromJson(Map<String, dynamic> json) => Favourite(
      id: json['id'],
      user_id: json['user_id'],
      style_id: json['style_id'],
      title: json['title']);
}
