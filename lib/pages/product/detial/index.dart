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
   void _getProductDetial () async{
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
        child: ListView(
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
              padding: EdgeInsets.fromLTRB(ScreenAdaper.width(12), ScreenAdaper.height(12), ScreenAdaper.width(12),ScreenAdaper.height(12)),
              // child: Chip(
              //   label: Text('拉蒙布兰达英伦伯雅双肩包 16.8L 大容量满足1天-2天短途旅行'),
              //   avatar: CircleAvatar(
              //       //左侧内容背景颜色
              //       backgroundColor: Colors.green,
              //       //内容文本
              //       child: Text("购物区商品"),
              //     ),
              // ),
              child: Text.rich(
                TextSpan(
                  text: '购物区商品',
                  style: TextStyle(
                    backgroundColor: Theme.of(context).accentColor,
                    color: Theme.of(context).primaryColor
                  ),
                  children: [
                    TextSpan(
                      text: '拉蒙布兰达英伦伯雅双肩包 16.8L 大容量满足1天-2天短途旅行'
                    )
                  ]
                )
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CartNum(),
                  Text('库存999件')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
