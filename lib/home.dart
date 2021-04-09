import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_ui_test/app_size.dart';
import 'package:mobile_ui_test/side_bar.dart';

import 'constant.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, AppSizeConfig.getAppHeight(0)),
            child: SideBar(HomeContent(), Icons.menu, false,
                Colors.transparent, Colors.white),
          ),
        ));
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    height: AppSizeConfig.getAppHeight(25),
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.only(
                          bottomRight:
                          Radius.circular(AppSizeConfig.getAppWidth(7)),
                          bottomLeft:
                          Radius.circular(AppSizeConfig.getAppWidth(7)),
                        ),
                        image: DecorationImage(
                            image: AssetImage("assets/img.jpg"),
                            fit: BoxFit.cover)),
                    padding: EdgeInsets.fromLTRB(
                        0, AppSizeConfig.getAppHeight(3), 0, AppSizeConfig.getAppHeight(7)),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, AppSizeConfig.getAppHeight(3)),
                    child: Container()
                ),
                Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.only(
                      top: AppSizeConfig.getAppHeight(6),
                      bottom: AppSizeConfig.getAppHeight(1.3)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ScreenTitleText.withColor(text: "Attendance", color: Colors.white)
                    ],
                  ),
                ),
                Positioned(
                  top: AppSizeConfig.getAppHeight(20),
                  left: AppSizeConfig.getAppWidth(10),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: AppSizeConfig.getAppWidth(80),
                      padding: EdgeInsets.symmetric(
                          vertical: AppSizeConfig.getAppHeight(1.8),
                          horizontal: AppSizeConfig.getAppHeight(2)),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(AppSizeConfig.getAppHeight(30))),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.arrow_back_ios_outlined, color: Colors.deepPurpleAccent),
                          Text(
                            'June 2019', style: TextStyle(color: Colors.deepPurpleAccent),
                          ),
                          Icon(Icons.arrow_forward_ios_outlined, color: Colors.deepPurpleAccent),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Container(
              height: AppSizeConfig.getAppHeight(56),
              margin: EdgeInsets.symmetric(vertical: AppSizeConfig.getAppHeight(5), horizontal: AppSizeConfig.getAppWidth(5)),
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 11,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: DayOfTheWeek()),
                    ],
                  ),

                  SizedBox(height: AppSizeConfig.getAppHeight(3),),
                  Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: DayList()),
                  ],),
              ])
            ),
            SizedBox(height: AppSizeConfig.getAppHeight(3),),
            Column(
              children: [
                ListTabs(text: "Total Present", trailingText: "27"),
                SizedBox(height: AppSizeConfig.getAppHeight(4),),
                ListTabs(text: "Total Absent", trailingText: "03",)
              ],
            ),
            SizedBox(
              height: AppSizeConfig.getAppHeight(4),
            ),
          ],
        ),
      ),

      SizedBox(
        height: AppSizeConfig.getAppHeight(4),
      ),

    ]);
  }
}


class DayOfTheWeek extends StatelessWidget{
  List<String> days = ["Sun", "Mon", "Teus", "Wed", "Thurs", "Fri", "Sat"];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  days.map((e) =>
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizeConfig.getAppWidth(3), vertical: AppSizeConfig.getAppWidth(5)),
          child: Center(child: Text(e, style: TextStyle(color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold, fontSize: font20),)),
        )
      ).toList(),
    );

  }
}


class ListTabs extends StatelessWidget {
  String text;
  String trailingText;
  Color trailingColor;

  ListTabs({@required this.text, @required this.trailingText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizeConfig.getAppWidth(6)),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 6,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
              vertical: AppSizeConfig.getAppHeight(2),
              horizontal: AppSizeConfig.getAppWidth(4)),
           shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizeConfig.getGeneralImage(12)),
          ),
          title: Text(text, style: TextStyle(color: Colors.deepPurpleAccent, fontSize: font24 , fontWeight: FontWeight.bold),),
          trailing: Container(
            child: Container(
                padding: EdgeInsets.all(AppSizeConfig.getAppWidth(3)),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(300)),
                ),
                child: Text(trailingText, style: TextStyle(color: Colors.white, fontSize: font24, fontWeight: FontWeight.bold),)),
          ),
        ),
      ),
    );
  }
}





Widget DateNumberWidget(number, numberColor, dotColor) {
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(number, style: TextStyle(color: numberColor, fontSize: font26, fontWeight: FontWeight.bold) ,),
        Text('.', style: TextStyle(color: dotColor, fontSize: font26, fontWeight: FontWeight.bold),)
      ],
    );
}



class DateNumber extends StatelessWidget {


  List<Widget> dateNumbers;

  DateNumber({this.dateNumbers});


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:  dateNumbers.map((e) =>
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizeConfig.getAppWidth(3.65), vertical: AppSizeConfig.getAppWidth(2)),
            child: Center(child: e)
            )
      ).toList(),
    );
  }
}



Widget DayList (){

  List<List<Widget>> list = [
    [
    DateNumberWidget('31', Colors.grey[300], Colors.transparent,),
    DateNumberWidget('01', Colors.deepPurpleAccent, Colors.green,),
    DateNumberWidget('02', Colors.deepPurpleAccent,  Colors.green,),
    DateNumberWidget('03', Colors.deepPurpleAccent, Colors.red,),
    DateNumberWidget('04', Colors.deepPurpleAccent, Colors.green,),
    DateNumberWidget('05', Colors.deepPurpleAccent, Colors.green,),
    DateNumberWidget( '06', Colors.deepPurpleAccent, Colors.green,)
    ],

    [
    DateNumberWidget('07', Colors.red, Colors.green,),
    DateNumberWidget('08', Colors.deepPurpleAccent, Colors.green,),
    DateNumberWidget('09', Colors.deepPurpleAccent, Colors.green,),
    DateNumberWidget('10', Colors.deepPurpleAccent, Colors.green,),
    DateNumberWidget('11', Colors.deepPurpleAccent, Colors.green,),
    DateNumberWidget('12', Colors.deepPurpleAccent, Colors.green,),
    DateNumberWidget('13', Colors.deepPurpleAccent, Colors.green,)
    ],


    [
    DateNumberWidget('14', Colors.red,  Colors.green,),
    DateNumberWidget('15',  Colors.deepPurpleAccent, Colors.green,),
    DateNumberWidget('16', Colors.deepPurpleAccent, Colors.green,),
    DateNumberWidget('17', Colors.deepPurpleAccent, Colors.red,),
    DateNumberWidget('18', Colors.deepPurpleAccent, Colors.green,),
    DateNumberWidget('19', Colors.deepPurpleAccent, Colors.red,),
    DateNumberWidget('20', Colors.deepPurpleAccent, Colors.green,)
    ],
    [
    DateNumberWidget('21', Colors.red, Colors.green,),
    DateNumberWidget('22', Colors.deepPurpleAccent, Colors.green,),
    DateNumberWidget('23', Colors.deepPurpleAccent, Colors.green,),
    DateNumberWidget('24', Colors.deepPurpleAccent, Colors.green,),
    DateNumberWidget('25', Colors.deepPurpleAccent, Colors.green,),
    DateNumberWidget('26', Colors.deepPurpleAccent, Colors.green,),
    DateNumberWidget('27', Colors.deepPurpleAccent, Colors.green,)
    ],
    [
    DateNumberWidget('28', Colors.red, Colors.green,),
    DateNumberWidget('29', Colors.deepPurpleAccent, Colors.green,),
    DateNumberWidget('30', Colors.deepPurpleAccent, Colors.green,),
    DateNumberWidget('01', Colors.grey[200], Colors.transparent,),
    DateNumberWidget('02', Colors.grey[200], Colors.transparent,),
    DateNumberWidget('03', Colors.grey[200], Colors.transparent,),
    DateNumberWidget('04', Colors.grey[200], Colors.transparent,)
    ],
  ];

  return Column(
    children: list.map((e) =>
        DateNumber(dateNumbers: e)
    ).toList(),
  );

}


