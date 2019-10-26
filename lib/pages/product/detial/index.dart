import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../../services/ScreenAdaper.dart';
import '../../cart/CartNum.dart';

class ProductDetailPage extends StatefulWidget {
  @override
  Map arguments;
  ProductDetailPage({Key key, this.arguments}) : super(key: key);
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  var id;
  @override
  void initState() {
    super.initState();
    print(widget.arguments["id"]);
    this.id = widget.arguments["id"];
    this._getProductDetial();
  }

  void _getProductDetial() async {
    var apiurl = 'http://localhost:4000/api/product/detial';
    try {
      Response response;
      Dio dio = new Dio();
      response = await dio.post(apiurl, data: {'id': this.id});
      print(response);
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    ScreenAdaper.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('商品详情'),
      ),
      body: Container(
          color: Theme.of(context).backgroundColor,
          child: Stack(
            children: <Widget>[
              ListView(
                padding: EdgeInsets.only(bottom: ScreenAdaper.width(60)),
                children: <Widget>[
                  Container(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Swiper(
                        autoplay: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network(
                            "http://via.placeholder.com/350x150",
                            fit: BoxFit.fill,
                          );
                        },
                        itemCount: 3,
                        pagination: SwiperPagination(
                            builder: DotSwiperPaginationBuilder(
                                size: 5, //点点没选中时候的大小
                                activeSize: 5, //点点选中后的大小
                                color: Colors.white, //点点的颜色
                                activeColor: Theme.of(context).accentColor)),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        ScreenAdaper.width(12),
                        ScreenAdaper.height(16),
                        ScreenAdaper.width(12),
                        ScreenAdaper.height(16)),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          child: Text.rich(TextSpan(
                              text: 'wwwwwwwww',
                              style: TextStyle(
                                  fontSize: ScreenAdaper.size(10),
                                  color: Theme.of(context).primaryColor),
                              children: [
                                TextSpan(
                                  text: '拉蒙布兰达英伦伯雅双肩包 16.8L 大容量满足1天-2天短途旅行',
                                  style: TextStyle(
                                      fontSize: ScreenAdaper.size(16),
                                      color: Theme.of(context)
                                          .textTheme
                                          .title
                                          .color),
                                )
                              ])),
                        ),
                        Container(
                          width: ScreenAdaper.width(60),
                          height: ScreenAdaper.height(20),
                          decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(ScreenAdaper.height(10.0)))),
                          child: Center(
                            child: Text(
                              '购物区商品',
                              style: TextStyle(
                                  fontSize: ScreenAdaper.size(10),
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: ScreenAdaper.width(12),
                        right: ScreenAdaper.width(12),
                        bottom: ScreenAdaper.height(16)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CartNum(),
                        Text(
                          '库存999件',
                          style: TextStyle(
                              color: Theme.of(context).textTheme.subtitle.color,
                              fontSize: ScreenAdaper.size(13)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: ScreenAdaper.height(40),
                    color: Color(0xFFF5F5F5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: ScreenAdaper.width(30),
                          height: ScreenAdaper.height(0.5),
                          color: Color(0xFFD4D4D4),
                        ),
                        SizedBox(
                          width: ScreenAdaper.width(5),
                        ),
                        Text(
                          '宝贝描述',
                          style: TextStyle(
                              color: Theme.of(context).textTheme.subtitle.color,
                              fontSize: ScreenAdaper.size(14)),
                        ),
                        SizedBox(
                          width: ScreenAdaper.width(5),
                        ),
                        Container(
                          width: ScreenAdaper.width(30),
                          height: ScreenAdaper.height(0.5),
                          color: Color(0xFFD4D4D4),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: ScreenAdaper.height(15),
                        bottom: ScreenAdaper.height(15)),
                    child: Text('内容'),
                  ),
                  Container(
                    height: ScreenAdaper.height(40),
                    color: Color(0xFFF5F5F5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: ScreenAdaper.width(30),
                          height: ScreenAdaper.height(0.5),
                          color: Color(0xFFD4D4D4),
                        ),
                        SizedBox(
                          width: ScreenAdaper.width(5),
                        ),
                        Text(
                          '推荐商品',
                          style: TextStyle(
                              color: Theme.of(context).textTheme.subtitle.color,
                              fontSize: ScreenAdaper.size(14)),
                        ),
                        SizedBox(
                          width: ScreenAdaper.width(5),
                        ),
                        Container(
                          width: ScreenAdaper.width(30),
                          height: ScreenAdaper.height(0.5),
                          color: Color(0xFFD4D4D4),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                height: ScreenAdaper.width(50),
                width: ScreenAdaper.getScreenWidth(),
                child: Container(
                  height: ScreenAdaper.width(50),
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.08),
                          blurRadius: 3,
                          offset: Offset(0, -1))
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: ScreenAdaper.width(70),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.home,
                              size: 24,
                              color: Theme.of(context).textTheme.subhead.color,
                            ),
                            Text(
                              '首页',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).textTheme.subhead.color,
                                  fontSize: ScreenAdaper.size(12)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: ScreenAdaper.width(0.5),
                        color: Color(0xFFE1E1E1),
                      ),
                      Container(
                          width: ScreenAdaper.width(70),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                width: ScreenAdaper.width(70),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.shopping_cart,
                                      size: 24,
                                      color: Theme.of(context)
                                          .textTheme
                                          .subhead
                                          .color,
                                    ),
                                    Text(
                                      '购物车',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .subhead
                                              .color,
                                          fontSize: ScreenAdaper.size(12)),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                width: ScreenAdaper.width(18),
                                height: ScreenAdaper.width(18),
                                top: ScreenAdaper.width(1),
                                right: ScreenAdaper.width(10),
                                child: Container(
                                  width: ScreenAdaper.width(18),
                                  height: ScreenAdaper.width(18),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              ScreenAdaper.width(10)))),
                                  child: Center(
                                    child: Text(
                                      '5',
                                      style: TextStyle(
                                          fontSize: ScreenAdaper.size(10),
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Theme.of(context).accentColor,
                          child: Center(
                            child: Text(
                              '加入购物车',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: ScreenAdaper.size(16),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Color(0xFFFC8458),
                          child: Center(
                            child: Text(
                              '立即购买',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: ScreenAdaper.size(16),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
