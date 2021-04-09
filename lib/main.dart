import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_ui_test/app_size.dart';
import 'package:mobile_ui_test/constant.dart';
import 'package:mobile_ui_test/home.dart';
import 'package:mobile_ui_test/side_bar.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
              builder: (context, orientation) {
                AppSizeConfig().init(constraints, orientation);
                return new MediaQuery(
                    data: new MediaQueryData(),
                    child: MaterialApp(
                        home: Home(),
                        debugShowCheckedModeBanner: false,

                    ));

              }
          );
        }
    );
  }
}



