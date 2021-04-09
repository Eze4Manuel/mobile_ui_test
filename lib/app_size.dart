import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class AppSizeConfig {
  static double _screenWidth;
  static double _screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;
  static double widthMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockWidth = _screenWidth / 100;
    _blockHeight = _screenHeight / 100;

    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;


  }


//Getting the proportionate height as per screen size
  static double getAppHeight(double inputHeight){
    return inputHeight * AppSizeConfig.heightMultiplier;
  }

//Getting the proportionate width as per screen size
  static double getAppWidth(double inputWidth){
    return inputWidth * AppSizeConfig.widthMultiplier;
  }


//Getting the proportionate width as per screen size
  static double getGeneralImage(double inputSize){
    return inputSize * AppSizeConfig.imageSizeMultiplier;
  }


//Getting the proportionate width as per screen size
  static double getGeneralText(double inputSize){
    return inputSize * AppSizeConfig.textMultiplier;
  }


}


