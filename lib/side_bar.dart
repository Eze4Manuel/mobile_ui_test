
import 'package:flutter/material.dart';
import 'package:mobile_ui_test/app_size.dart';
import 'package:mobile_ui_test/constant.dart';
import 'package:mobile_ui_test/menu_nav.dart';
import 'menu_item.dart';


//Sidebar for navigationing. Uses Animation to translate between States of the Sidebar
class SideBar extends StatefulWidget {
  Widget _pageContent;
  Color _menuBackgroundColor;
  Color _menuIconColor;
  bool _withDecoration;
  var _iconType;
  SideBar(this._pageContent, this._iconType, this._withDecoration, this._menuBackgroundColor, this._menuIconColor);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    //Method to programatically open Drawer
    void _openDrawer() {
     }

    //Method to programatically close open Drawer
    void _closeDrawer() {
     }

    return Scaffold(
      //Key keeps track of this specific Scaffold
      key: _scaffoldKey,
      body: Stack(
          children: [
            widget._pageContent,
            MenuNav( (widget._iconType == Icons.menu)? _openDrawer : _closeDrawer, widget._iconType, widget._withDecoration, widget._menuBackgroundColor, widget._menuIconColor)
          ]
      ),
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,

      drawerScrimColor: Colors.black26,
      drawer: Container(
        width: AppSizeConfig.getAppWidth(80),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(100.0),
              bottomRight: Radius.circular(100.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(spreadRadius: 1, blurRadius: 20, color: Colors.grey.withOpacity(0.3),
            ),
          ],
        ),
        child: Drawer(
          child: SideBarContentWidget(),
        ),
      ),
    );
  }
}




class SideBarContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: AppSizeConfig.getAppHeight(40),
            child:  TopSideBarWidget(),
          ),
          Container(
            height: AppSizeConfig.getAppHeight(60),
            padding: EdgeInsets.symmetric(
                horizontal: AppSizeConfig.getAppWidth(3),
                vertical: AppSizeConfig.getAppHeight(1)
            ),
            color: Colors.white,
            child:  Container(
                child: BottomSideBarWidget()),
          ),

        ],
      ),
    );
  }
}



class TopSideBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
             ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
                decoration:new BoxDecoration(
                    image:  new DecorationImage(
                      image: AssetImage("assets/menu.png"),
                      fit: BoxFit.cover,

                    )
                ),
                padding: EdgeInsets.only(
                    top: AppSizeConfig.getAppHeight(5),
                    left: AppSizeConfig.getAppWidth(3),
                    right: AppSizeConfig.getAppWidth(3),
                    bottom: AppSizeConfig.getAppHeight(2)
                ),

                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: Container(
                          width: AppSizeConfig.getGeneralImage(25),
                          height: AppSizeConfig.getAppHeight(15),
                          decoration:new BoxDecoration(
                              image:  new DecorationImage(
                                image: AssetImage("assets/Avatar.png"),
                                fit: BoxFit.cover,)
                          ),
                        ),
                      ),
                      Text('Gloria Yaro', style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500,
                          fontFamily: "Poppins", fontSize: font26
                      )),
                      Text(
                          'freeslab88@gmail.com',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                              fontFamily: "PoppinsMediun",
                              fontSize: font18
                          )),

                      SizedBox(height: AppSizeConfig.getAppHeight(2),),

                      Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(70),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Wallet balance',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold,
                                        fontFamily: "PoppinsMedium", fontSize: font14
                                    )
                                ),
                                Text('N2,500',
                                    style: TextStyle(
                                        color: kPrimaryColor, fontWeight: FontWeight.bold,
                                        fontFamily: "PoppinsMedium", fontSize: font14
                                    )
                                ),
                                Icon(Icons.arrow_forward_ios, color: Colors.black12, size: AppSizeConfig.getGeneralImage(4)),
                              ],
                            ),
                          )),

                    ],
                  ),
                )
            ),
          ),
        ]
    );
  }
}


class BottomSideBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Container(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            child: MenuItem(title: "Settings",
              icon: Icons.settings,
              onTap: (){
                Navigator.of(context).pop();
               },
            ),
          ),
        ),
        SizedBox(height: AppSizeConfig.getAppHeight(2),)

      ],
    );
  }
}
