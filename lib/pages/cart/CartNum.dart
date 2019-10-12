import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../services/ScreenAdaper.dart';

class CartNum extends StatefulWidget {
  CartNum({Key key}) : super(key: key);

  _CartNumState createState() => _CartNumState();
}

class _CartNumState extends State<CartNum> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenAdaper.width(164),
      child: Row(
        children: <Widget>[
          _leftBtn(),
          _centerArea(),
          _rightBtn()
        ],
      ),
    );
  }

  //左侧按钮

  Widget _leftBtn() {
    return InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        width: ScreenAdaper.width(20),
        height: ScreenAdaper.height(20),
        child: Icon(Icons.remove,size: 16,),
      ),
    );
  }

  //右侧按钮
  Widget _rightBtn() {
    return InkWell(
      onTap: (){


      },
      child: Container(
        alignment: Alignment.center,
        width: ScreenAdaper.width(20),
        height: ScreenAdaper.height(20),
        child: Icon(Icons.add,size: 16,),
      ),
    );
  }

//中间
  Widget _centerArea() {
    return Container(
      alignment: Alignment.center,
      width: ScreenAdaper.width(30),
      color: Color.fromRGBO(245, 245, 245, 1),
      height: ScreenAdaper.height(20),
      child: Text("1",
       style: TextStyle(
           fontSize: ScreenAdaper.size(12),
           fontWeight: FontWeight.bold,
           color: Color.fromRGBO(17, 17, 17, 1)
         ),
      ),
    );
  }
}
