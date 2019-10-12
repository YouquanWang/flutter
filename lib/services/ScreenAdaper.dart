
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ScreenAdaper{

  static init(context){
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
  }
  static height(double value){
     return ScreenUtil.getInstance().setHeight(value);
  }
  static width(double value){
      return ScreenUtil.getInstance().setWidth(value);
  }
  static getScreenHeight(){
    return ScreenUtil.screenHeightDp;
  }
  static getScreenWidth(){
    return ScreenUtil.screenWidthDp;
  }

  static getScreenPxHeight(){
    return ScreenUtil.screenHeight;
  }
  static getScreenPxWidth(){
    return ScreenUtil.screenWidth;
  }

  static size(double value){
   return ScreenUtil.getInstance().setSp(value);  
  }

  // ScreenUtil.screenHeight 
}

// ScreenAdaper