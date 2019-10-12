import 'package:flutter/material.dart';
import '../../services/ScreenAdaper.dart';
import './CartItem.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPage createState() => _CartPage();
}

class _CartPage extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Stack(
          children: <Widget>[
            ListView(
              padding: EdgeInsets.only(
                  top: ScreenAdaper.height(6), bottom: ScreenAdaper.height(56)),
              children: <Widget>[
                CartItem(),
                CartItem(),
                CartItem(),
                CartItem(),
                CartItem()
              ],
            ),
            Positioned(
              width: ScreenAdaper.width(375),
              height: ScreenAdaper.height(50),
              bottom: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.08),
                        blurRadius: 3,
                        offset: Offset(0, -1))
                  ],
                ),
                padding: EdgeInsets.only(left: ScreenAdaper.width(14)),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: ScreenAdaper.width(20),
                            margin: EdgeInsets.only(right: ScreenAdaper.width(6)),
                            child: Checkbox(
                              value: true,
                              activeColor: Colors.pink,
                              onChanged: (val) {},
                            ),
                          ),
                          Text(
                            "全选",
                            style: TextStyle(
                                fontSize: ScreenAdaper.size(14),
                                color: Theme.of(context).textTheme.title.color),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(left: ScreenAdaper.width(15)),
                        child: Row(
                          children: <Widget>[
                            Text(
                              '共计:',
                              style: TextStyle(
                                  fontSize: ScreenAdaper.size(14),
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).textTheme.title.color),
                            ),
                            Text(
                              '￥1,900.00',
                              style: TextStyle(
                                  fontSize: ScreenAdaper.size(16),
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).accentColor),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: ScreenAdaper.width(120),
                      height: ScreenAdaper.height(50),
                      color: Theme.of(context).accentColor,
                      child: Center(
                        child: Text(
                          '去结算(2)',
                          style: TextStyle(
                              fontSize: ScreenAdaper.size(17),
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
