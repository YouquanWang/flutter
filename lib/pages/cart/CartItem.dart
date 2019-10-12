import 'package:flutter/material.dart';
import '../../services/ScreenAdaper.dart';
import './CartNum.dart';
class CartItem extends StatefulWidget {
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(ScreenAdaper.width(12),0,ScreenAdaper.width(12),0),
      margin: EdgeInsets.only(bottom: ScreenAdaper.height(6),top: ScreenAdaper.height(6) ),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenAdaper.width(24),
            margin: EdgeInsets.only(right: ScreenAdaper.width(14)),
            child: Checkbox(
              tristate: true,
              value: true,
              onChanged: (val) {},
              activeColor: Colors.pink,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                padding: EdgeInsets.all(ScreenAdaper.width(14)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.08),
                        blurRadius: 6,
                        offset: Offset(0, 3))
                  ],
                ),
                child: Stack(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: ScreenAdaper.width(85),
                          height: ScreenAdaper.height(85),
                          margin:
                              EdgeInsets.only(right: ScreenAdaper.width(10)),
                          child: Image.network(
                              "https://www.itying.com/images/flutter/list2.jpg",
                              fit: BoxFit.cover),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: ScreenAdaper.height(85),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    '宽松韩风字母印花系带设计 五分袖T恤',
                                    style: TextStyle(
                                        color: Color.fromRGBO(17, 17, 17, 1),
                                        fontSize: ScreenAdaper.size(13)),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                      text: '¥',
                                      style: TextStyle(
                                          fontSize: ScreenAdaper.size(12),
                                          color:
                                              Color.fromRGBO(251, 72, 68, 1)),
                                      children: [
                                        TextSpan(
                                          text: '78',
                                          style: TextStyle(
                                              fontSize: ScreenAdaper.size(16),
                                              color: Color.fromRGBO(
                                                  251, 72, 68, 1)),
                                        ),
                                        TextSpan(
                                          text: '.00',
                                          style: TextStyle(
                                              fontSize: ScreenAdaper.size(14),
                                              color: Color.fromRGBO(
                                                  251, 72, 68, 1)),
                                        )
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: ScreenAdaper.width(30)),
                          width: ScreenAdaper.width(20),
                          height: ScreenAdaper.height(20),
                          child: Icon(Icons.delete_outline),
                        )
                      ],
                    ),
                    Positioned(
                      width: ScreenAdaper.width(70),
                      height: ScreenAdaper.height(20),
                      bottom: 0,
                      right: 0,
                      child: CartNum(),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
