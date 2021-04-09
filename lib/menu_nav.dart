 import 'package:flutter/material.dart';
import 'package:mobile_ui_test/app_size.dart';


class MenuNav extends StatelessWidget {
  var icon;
  var action;
  bool withDecoration;
  Color withBackground;
  Color color;
  MenuNav( this.action, this.icon, this.withDecoration, this.withBackground, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: AppSizeConfig.getAppWidth(4), top: AppSizeConfig.getAppHeight(5)),
      decoration:  (withDecoration)? BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ) : null,
      child: GestureDetector(
        onTap: (){
          action();
        },
        child: ClipOval(
          child: Container(
            padding: EdgeInsets.all(7),
            color: withBackground,
            child: Icon(icon, color: color),
          ),
        ),
      ),
    );
  }
}
