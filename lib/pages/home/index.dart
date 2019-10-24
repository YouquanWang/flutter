import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
// import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
// import 'package:flutter_easyrefresh/ball_pulse_header.dart';
// import 'package:flutter_easyrefresh/phoenix_footer.dart';
import 'package:flutter_easyrefresh/phoenix_header.dart';
// import 'package:jiesuanflutter/model/ProductModel.dart';
// import 'package:flutter_easyrefresh/bezier_circle_header.dart';
// import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
import '../../services/ScreenAdaper.dart';
import '../../model/product_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> with AutomaticKeepAliveClientMixin {
  EasyRefreshController _controller;
  ScrollController _scrollController;
  List list = [];
  int _page = 1;
  //每页有多少条数据
  int _pageSize = 10;
  //解决重复请求的问题
  bool flag = true;
  //是否有数据
  bool _hasMore = true;

  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    _scrollController = ScrollController();
    this._getProduct();
  }

  void _getProduct() async {
    setState(() {
      this.flag = false;
    });
    var apiurl = 'http://localhost:4000/api/product/list';
    try {
      Response response;
      Dio dio = new Dio();
      response = await dio.post(apiurl, data: {'limit': 8, 'page': this._page});
      var result = productModel.fromJson(response.data);
      var data = result.data;
      if (data.length < this._pageSize) {
        setState(() {
          this.list.addAll(data);
          this._hasMore = false;
          this.flag = true;
        });
      } else {
        setState(() {
          this.list.addAll(data);
          this._page++;
          this.flag = true;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  //下拉刷新
  Future<void> _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        this.list = [];
        this._page = 1;
        this.flag = true;
        this._hasMore = true;
      });
      this._getProduct();
      _controller.resetLoadState();
      _controller.finishRefresh();
    });
  }

  //首页轮播
  Widget _homeBanner() {
    return Container(
      padding: EdgeInsets.fromLTRB(ScreenAdaper.width(12),
          ScreenAdaper.width(40), ScreenAdaper.width(12), 0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/bg.png'),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '首页',
                style: TextStyle(
                    color: Theme.of(context).accentTextTheme.title.color,
                    fontSize: ScreenAdaper.size(20),
                    fontWeight: FontWeight.bold),
              ),
              ClipOval(
                child: Image.network(
                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568786047485&di=e424439ccc47ff41f8f91dda1af0d01d&imgtype=0&src=http%3A%2F%2Fwww.xihabang.com%2Fuploadfile%2F2013%2F1127%2F20131127034933696.png',
                  width: ScreenAdaper.width(20),
                  height: ScreenAdaper.height(20),
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          SizedBox(
            height: ScreenAdaper.height(12),
          ),
          Container(
            height: ScreenAdaper.width(180.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Swiper(
              autoplay: true,
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    "http://via.placeholder.com/350x150",
                    fit: BoxFit.fill,
                  ),
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
          )
        ],
      ),
    );
  }

  // 公告 轮播
  Widget _noticeList() {
    return Container(
      padding: EdgeInsets.fromLTRB(
          ScreenAdaper.width(12), 0, ScreenAdaper.width(12), 0),
      child: Container(
        padding: EdgeInsets.fromLTRB(
            ScreenAdaper.width(10), 0, ScreenAdaper.width(10), 0),
        height: ScreenAdaper.height(44),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.06),
                blurRadius: 6,
                offset: Offset(0, 3))
          ],
        ),
        child: Row(
          children: <Widget>[
            Image.asset(
              'images/notice_icon.png',
              width: ScreenAdaper.width(30),
              height: ScreenAdaper.height(15),
            ),
            SizedBox(
              width: ScreenAdaper.width(15),
              height: ScreenAdaper.height(30),
            ),
            Expanded(
              flex: 1,
              child: Swiper(
                autoplay: true,
                containerHeight: ScreenAdaper.height(44),
                itemHeight: ScreenAdaper.height(44),
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Align(
                      alignment: FractionalOffset.centerLeft,
                      child: Row(
                        children: <Widget>[
                          Text(
                            'HOT',
                            style: TextStyle(
                                fontSize: ScreenAdaper.size(14),
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: ScreenAdaper.width(3),
                            height: ScreenAdaper.height(30),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '11111111111111111111111111111111111111111111111',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ));
                },
                itemCount: 5,
              ),
            ),
            SizedBox(
              width: ScreenAdaper.width(10),
              height: ScreenAdaper.height(30),
            ),
            Container(
              width: ScreenAdaper.width(1),
              height: ScreenAdaper.height(30),
              color: Color.fromRGBO(228, 228, 228, 1),
            ),
            SizedBox(
              width: ScreenAdaper.width(10),
              height: ScreenAdaper.height(30),
            ),
            SizedBox(
              width: ScreenAdaper.width(14),
              height: ScreenAdaper.height(14),
              child: IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                color: Color.fromRGBO(158, 158, 158, 1),
                iconSize: 14,
                padding: EdgeInsets.all(0),
                onPressed: () {
                  print(111);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

//  产品列表标题
  Widget _productTitle() {
    return Container(
      padding: EdgeInsets.fromLTRB(
          ScreenAdaper.width(12), 0, ScreenAdaper.width(12), 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: ScreenAdaper.width(4),
                height: ScreenAdaper.height(20),
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(252, 139, 97, 1),
                        Theme.of(context).accentColor,
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(2.0))),
              ),
              Text(
                '购物区',
                style: TextStyle(
                    color: Theme.of(context).textTheme.title.color,
                    fontSize: ScreenAdaper.size(16),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          InkWell(
            child: Text(
              '更多',
              style: TextStyle(
                  color: Color.fromRGBO(252, 132, 88, 1),
                  fontSize: ScreenAdaper.size(14)),
            ),
            onTap: () {
              // showAlertDialog(context);
              showSimpleDialod(context);
              // showBottomSheet(context);
            },
          )
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

  @override
  bool get wantKeepAlive => true;
  Widget build(BuildContext context) {
    super.build(context);
    ScreenAdaper.init(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('首页'),
      // ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: EasyRefresh(
          onRefresh: this._onRefresh,
          enableControlFinishRefresh: true,
          enableControlFinishLoad: true,
          controller: _controller,
          scrollController: _scrollController,
          topBouncing: true,
          bottomBouncing: true,
          taskIndependence: false,
          // header: ClassicalHeader(
          //   enableInfiniteRefresh: false,
          //   refreshText: '下拉刷新',
          //   refreshingText: '正在刷新...',
          //   refreshedText: '刷新完成!',
          //   refreshFailedText: '刷新失败',
          //   noMoreText: '暂无更多数据',
          //   showInfo: false,
          //   infoText: '更新于 %T',
          //   refreshReadyText: '放下刷新！',
          //   float: false,
          //   enableHapticFeedback: true,
          // ),
          footer: ClassicalFooter(
            enableInfiniteLoad: true,
            loadText: '上拉加载',
            loadingText: '正在加载...',
            loadedText: '加载完成!',
            loadFailedText: '加载失败！',
            noMoreText: '暂无更多数据',
            showInfo: false,
            infoText: '更新于 %T',
            enableHapticFeedback: true,
          ),
          // header: BallPulseHeader(),
          // footer: BallPulseFooter(),
          header: PhoenixHeader(),
          // footer: PhoenixFooter(),
          child: ListView(
            controller: _scrollController,
            children: <Widget>[
              this._homeBanner(),
              SizedBox(
                height: ScreenAdaper.height(10),
              ),
              this._noticeList(),
              SizedBox(
                height: ScreenAdaper.height(20),
              ),
              this._productTitle(),
              SizedBox(
                height: ScreenAdaper.height(14),
              ),
              this._productListWidget()
            ],
          ),
          onLoad: () async {
            await Future.delayed(Duration(seconds: 2), () {
              if (this.flag && this._hasMore) {
                this._getProduct();
              }
              _controller.finishLoad(noMore: !this._hasMore);
            });
          },
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('this is alertdialog'),
            title: Center(
                child: Text(
              '标题',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenAdaper.size(20.0),
                  fontWeight: FontWeight.bold),
            )),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('确定')),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('取消')),
            ],
          );
        });
  }

  void showSimpleDialod(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Center(
              child: Text('选择'),
            ),
            children: <Widget>[
              SimpleDialogOption(
                child: Text("Option A"),
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: "你选择了Option A",
                    toastLength: Toast.LENGTH_SHORT,
                    timeInSecForIos: 1,
                    backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
                    textColor: Colors.white,
                  );
                  Navigator.pop(context, 'Option A');
                },
              ),
              Divider(),
              SimpleDialogOption(
                child: Text("Option B"),
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: "你选择了Option B",
                    toastLength: Toast.LENGTH_SHORT,
                    timeInSecForIos: 1,
                    backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
                    textColor: Colors.white,
                  );
                  Navigator.pop(context, 'Option B');
                },
              ),
              Divider(),
              SimpleDialogOption(
                child: Text("Option C"),
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: "你选择了Option C",
                    toastLength: Toast.LENGTH_SHORT,
                    timeInSecForIos: 1,
                    backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
                    textColor: Colors.white,
                  );
                  Navigator.pop(context, 'Option C');
                },
              )
            ],
          );
        });
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text("分享 A"),
                  onTap: () {
                    Navigator.pop(context, 'A');
                  },
                ),
                ListTile(
                  title: Text("分享 B"),
                  onTap: () {
                    Navigator.pop(context, 'B');
                  },
                ),
                ListTile(
                  title: Text("分享 C"),
                  onTap: () {
                    Navigator.pop(context, 'C');
                  },
                )
              ],
            ),
          );
        });
  }
}
