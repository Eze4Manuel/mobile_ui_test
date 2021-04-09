 import 'package:flutter/material.dart';
import 'package:mobile_ui_test/app_size.dart';

import 'constant.dart';

class MenuItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  const MenuItem({Key key, this.icon, this.title, this.onTap}) : super(key: key);

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    //Declaring template for items needed in the menu navigation and attaching a GestureDetector triggering events n taps
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: AppSizeConfig.getAppWidth(4),
            top: AppSizeConfig.getAppHeight(2.5),
            bottom: AppSizeConfig.getAppHeight(2.5),
          ),
          child: Row(
            children: <Widget>[
              Icon(widget.icon, color: Colors.black38, size: AppSizeConfig.getGeneralImage(5)),
              SizedBox( width: AppSizeConfig.getAppWidth(3) ),
              Text(widget.title, style: TextStyle(fontWeight: FontWeight.w600, fontFamily: "PoppinsMedium",
                  fontSize: font20, color: Colors.black87),)
            ],
          )
      ),
    );
  }
}
