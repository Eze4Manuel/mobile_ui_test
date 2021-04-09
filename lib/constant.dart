
import 'package:flutter/material.dart';
import 'package:mobile_ui_test/app_size.dart';

//Contains Constant Used Generally
const kPrimaryColor = Color.fromRGBO(255, 109, 0, 1);
 const kSecondaryColor = Color.fromRGBO(211, 56, 0, 0.78);
const GarmaPrimaryColor = Colors.black26;



 class ScreenTitleText extends StatelessWidget {
  String text;
  Color color = Colors.black;

  ScreenTitleText(this.text);

  ScreenTitleText.withColor({this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(
             fontFamily: "Poppins",
            color: color,
            fontSize: font30,
            fontWeight: FontWeight.bold));
  }
}



//Gradient Type Constants fonts
double font34 = AppSizeConfig.getGeneralText(3.4);
double font32 = AppSizeConfig.getGeneralText(3.2);
double font30 = AppSizeConfig.getGeneralText(3.0);
double font28 = AppSizeConfig.getGeneralText(2.8);
double font26 = AppSizeConfig.getGeneralText(2.6);
double font24 = AppSizeConfig.getGeneralText(2.4);
double font22 = AppSizeConfig.getGeneralText(2.2);
double font20 = AppSizeConfig.getGeneralText(2);
double font12 = AppSizeConfig.getGeneralText(1.2);
double font14 = AppSizeConfig.getGeneralText(1.4);
double font16 = AppSizeConfig.getGeneralText(1.6);
double font18 = AppSizeConfig.getGeneralText(1.8);
double font10 = AppSizeConfig.getGeneralText(1);
double font08 = AppSizeConfig.getGeneralText(0.8);
double font06 = AppSizeConfig.getGeneralText(0.6);
double font04 = AppSizeConfig.getGeneralText(0.4);
