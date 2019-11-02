import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:jiesuanflutter/model/product_detail_model.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import '../../../services/ScreenAdaper.dart';
import '../../cart/CartNum.dart';
import '../../../widget/LoadingWidget.dart';
import '../../../model/product_model.dart';
class ProductDetailPage extends StatefulWidget {
  @override
  Map arguments;
  ProductDetailPage({Key key, this.arguments}) : super(key: key);
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int id;
  var content;
  List contentArr = [];
  List list = [];
  List imgArr;
  String title;
  @override
  void initState() {
    super.initState();
    this.id = widget.arguments["id"];
    this._getProduct();
    this._getProductDetial();
  }
void _getProduct() async {
    var apiurl = 'http://localhost:4000/api/product/list';
    try {
      Response response;
      Dio dio = new Dio();
      response = await dio.post(apiurl, data: {'limit': 4, 'page': 1});
      var result = productModel.fromJson(response.data);
      var data = result.data;
      setState(() {
          this.list.addAll(data);
      });
    } catch (e) {
      print(e);
    }
  }
  void _getProductDetial() async {
    var apiurl = 'http://localhost:4000/api/product/detial';
    try {
      Response response;
      Dio dio = new Dio();
      response = await dio.post(apiurl, data: {'id': this.id});
      var data = productDetailModel.fromJson(response.data);
      setState(() {
        this.contentArr.add(data.data);
        this.content = data.data;
        this.imgArr = this.content.groupImg.split('-');
      });
    } catch (e) {
      print(e);
    }
  }

  Widget _productSwiper() {
    return Swiper(
      autoplay: true,
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          this.imgArr[index],
          fit: BoxFit.fill,
        );
      },
      itemCount: this.imgArr.length,
      pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
              size: 5, //点点没选中时候的大小
              activeSize: 5, //点点选中后的大小
              color: Colors.white, //点点的颜色
              activeColor: Theme.of(context).accentColor)),
    );
  }

  Widget _productInfo() {
    return Container(
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
                    text: this.content.title,
                    style: TextStyle(
                        fontSize: ScreenAdaper.size(16),
                        color: Theme.of(context).textTheme.title.color),
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
                    fontSize: ScreenAdaper.size(10), color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _productNumber() {
    return Container(
      padding: EdgeInsets.only(
          left: ScreenAdaper.width(12),
          right: ScreenAdaper.width(12),
          bottom: ScreenAdaper.height(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CartNum(this.content),
          Text(
            '库存999件',
            style: TextStyle(
                color: Theme.of(context).textTheme.subtitle.color,
                fontSize: ScreenAdaper.size(13)),
          )
        ],
      ),
    );
  }

  Widget _productTitle(title) {
    return Container(
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
            title,
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
    );
  }

  //产品列表
  Widget _productListWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(
          ScreenAdaper.width(12), 0, ScreenAdaper.width(12), 0),
      child: GridView.builder(
        shrinkWrap: true,
        primary: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 65 / 100,
            crossAxisSpacing: ScreenAdaper.width(5),
            mainAxisSpacing: ScreenAdaper.width(5)),
        padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenAdaper.width(10)),
        physics: NeverScrollableScrollPhysics(),
        itemCount: this.list.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/product/detial',
                        arguments: {"id": this.list[index].id});
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.06),
                      blurRadius: 8,
                      offset: Offset(0, 3))
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                        this.list[index].pic,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: ScreenAdaper.height(32),
                          child: Text(
                            "${this.list[index].title}",
                            style: TextStyle(
                                color: Theme.of(context).textTheme.title.color,
                                fontSize: ScreenAdaper.size(13)),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: ScreenAdaper.height(10),
                        ),
                        Text.rich(
                          TextSpan(
                              text: '¥',
                              style: TextStyle(
                                  fontSize: ScreenAdaper.size(12),
                                  color: Theme.of(context).accentColor),
                              children: [
                                TextSpan(
                                  text: this.list[index].price.split('.')[0],
                                  style: TextStyle(
                                      fontSize: ScreenAdaper.size(16),
                                      color: Theme.of(context).accentColor),
                                ),
                                TextSpan(
                                  text: '.' +
                                      this.list[index].price.split('.')[1],
                                  style: TextStyle(
                                      fontSize: ScreenAdaper.size(14),
                                      color: Theme.of(context).accentColor),
                                )
                              ]),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _productBottom() {
    return Positioned(
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
                        color: Theme.of(context).textTheme.subhead.color,
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
                            color: Theme.of(context).textTheme.subhead.color,
                          ),
                          Text(
                            '购物车',
                            style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.subhead.color,
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
                                Radius.circular(ScreenAdaper.width(10)))),
                        child: Center(
                          child: Text(
                            '5',
                            style: TextStyle(
                                fontSize: ScreenAdaper.size(10),
                                color: Theme.of(context).primaryColor),
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
    );
  }

  Widget build(BuildContext context) {
    ScreenAdaper.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('商品详情'),
      ),
      body: this.contentArr.length > 0
          ? Container(
              color: Theme.of(context).backgroundColor,
              child: Stack(
                children: <Widget>[
                  ListView(
                    padding: EdgeInsets.only(bottom: ScreenAdaper.width(60)),
                    children: <Widget>[
                      Container(
                        child: AspectRatio(
                            aspectRatio: 1, child: _productSwiper()),
                      ),
                      _productInfo(),
                      _productNumber(),
                      _productTitle('宝贝描述'),
                      Container(
                        padding: EdgeInsets.only(
                            top: ScreenAdaper.height(15),
                            bottom: ScreenAdaper.height(15)),
                        child: Html(
                          data: """${this.content.content}""",
                          //Optional parameters:
                          padding: EdgeInsets.all(8.0),
                          linkStyle: const TextStyle(
                            color: Colors.redAccent,
                            decorationColor: Colors.redAccent,
                            decoration: TextDecoration.underline,
                          ),
                          //Must have useRichText set to false for this to work
                          customRender: (node, children) {
                            if (node is dom.Element) {
                              switch (node.localName) {
                                case "custom_tag":
                                  return Column(children: children);
                              }
                            }
                            return null;
                          },
                          customTextAlign: (dom.Node node) {
                            if (node is dom.Element) {
                              switch (node.localName) {
                                case "p":
                                  return TextAlign.justify;
                              }
                            }
                            return null;
                          },
                          customTextStyle:
                              (dom.Node node, TextStyle baseStyle) {
                            if (node is dom.Element) {
                              switch (node.localName) {
                                case "p":
                                  return baseStyle.merge(
                                      TextStyle(height: 1.5, fontSize: 14));
                              }
                            }
                            return baseStyle;
                          },
                        ),
                      ),
                      _productTitle('推荐商品'),
                      SizedBox(
                        height: ScreenAdaper.width(10),
                      ),
                      _productListWidget()
                    ],
                  ),
                  _productBottom()
                ],
              ))
          : LoadingWidget(),
    );
  }
}
