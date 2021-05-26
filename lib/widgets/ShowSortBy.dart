import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


sortPopupPressed(context1) {
  Alert(
      context: context1,
      title: "Sory By",
      content: Column(
        children: <Widget>[

          ListTile(
            title: const Text('Name'),
            leading: Radio(
              value: "Name",
              groupValue: "Name",
              onChanged: (String value) { },
            ),
          ),
          ListTile(
            title: const Text('Price Ascending'),
            leading: Radio(
              toggleable: false,
              autofocus: false,
              value: "Price Ascending",
              groupValue: "Price Ascending",
              onChanged: (String value) { },
            ),
          ),

          ListTile(
            title: const Text('Price Descending'),
            leading: Radio(
              value: "Price Descending",
              groupValue: "Price Descending",
              onChanged: (String value) { },
            ),
          ),

          // TextField(
          //   decoration: InputDecoration(
          //     icon: Icon(Icons.account_circle),
          //     labelText: 'Username',
          //   ),
          // ),
          // TextField(
          //   obscureText: true,
          //   decoration: InputDecoration(
          //     icon: Icon(Icons.lock),
          //     labelText: 'Password',
          //   ),
          // ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context1),
          child: Text(
            "Submit",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ]).show();
}

// https://pub.dev/packages/rflutter_alert/example