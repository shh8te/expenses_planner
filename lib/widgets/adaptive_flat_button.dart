import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final Function _showDatePicker;

  AdaptiveFlatButton(this.text, this._showDatePicker);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: _showDatePicker,
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ))
        : FlatButton(
            textColor: Theme.of(context).primaryColor,
            onPressed: _showDatePicker,
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ));
  }
}
