import 'package:flutter/material.dart';

import 'asset_res.dart';

class Helpers {
  getAppBar() {
    AppBar();
  }

  getHeight(double height) {
    return SizedBox(
      height: height,
    );
  }

  getWidth(double width) {
    return SizedBox(
      width: width,
    );
  }

  getAppHeader(String title) {
    return AppBar(
      leading: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
      elevation: 0,
      backgroundColor: Colors.lightBlue,
      title: Text(title,style: TextStyle(
        color: Colors.white
      ),),
      centerTitle: true,
    );
  }

}
