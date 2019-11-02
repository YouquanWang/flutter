import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../services/ScreenAdaper.dart';
import '../../model/product_detail_model.dart';
import '../../services/CartService.dart';
class CartNum extends StatefulWidget {
  DetialContent _content;
  CartNum(this._content,{Key key}) : super(key: key);

  _CartNumState createState() => _CartNumState();
}

class _CartNumState extends State<CartNum> {
  DetialContent _content;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._content = widget._content;
  }
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
      onTap: () {
        setState(() {
          if (this._content.count > 1) {
          this._content.count = this._content.count-1;
        }
        });
      },
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
        setState(() {
          this._content.count = this._content.count+1;
          CartService.addCart(this._content);
        });
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
      child: Text("${this._content.count}",
       style: TextStyle(
           fontSize: ScreenAdaper.size(12),
           fontWeight: FontWeight.bold,
           color: Theme.of(context).textTheme.title.color
         ),
      ),
    );
  }
}
