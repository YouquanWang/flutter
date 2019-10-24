<<<<<<< HEAD
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../../services/ScreenAdaper.dart';

class ProductDetailPage extends StatefulWidget {
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    ScreenAdaper.init(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('商品详情'),
      // ),
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
              child: Wrap(
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 20,
                    child: Center(
                      child: Text('购物区商品'),
                    ),
                  ),
                  Text('拉蒙布兰达英伦伯雅双肩包 16.8L 大容量满足1天-2天短途旅行')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
=======
import 'package:flutter/material.dart';
>>>>>>> xiugai
