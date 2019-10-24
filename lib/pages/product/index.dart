import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../../services/ScreenAdaper.dart';
import '../../model/product_model.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPage createState() => _ProductPage();
}

class _ProductPage extends State<ProductPage>
    with AutomaticKeepAliveClientMixin {
  EasyRefreshController _controller;
  ScrollController _scrollController;
  List list = [];
  int _page = 1;
  //每页有多少条数据
  int _pageSize = 8;
  //解决重复请求的问题
  bool flag = true;
  //是否有数据
  bool _hasMore = true;

  @override
  bool get wantKeepAlive => true;

  @override
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

  Widget build(BuildContext context) {
    super.build(context);
    ScreenAdaper.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: ScreenAdaper.height(40),
          child: TextField(
            maxLines: 1,
            autofocus: false,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: ScreenAdaper.height(10),bottom:ScreenAdaper.height(10)),
                prefixIcon: Icon(Icons.search),
                hintText: '搜索宝贝',
                fillColor: Color.fromRGBO(243, 243, 243, 1),
                filled: true,
                hintStyle: TextStyle(
                  fontSize: ScreenAdaper.size(14),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none)),
            onChanged: (value) {
              setState(() {});
            },
          ),
        ),
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: EasyRefresh(
          onRefresh: null,
          // enableControlFinishRefresh: true,
          enableControlFinishLoad: true,
          controller: _controller,
          scrollController: _scrollController,
          topBouncing: false,
          bottomBouncing: true,
          taskIndependence: false,
          header: ClassicalHeader(
            enableInfiniteRefresh: false,
            refreshText: '下拉刷新',
            refreshingText: '正在刷新...',
            refreshedText: '刷新完成!',
            refreshFailedText: '刷新失败',
            noMoreText: '暂无更多数据',
            infoText: '更新于 %T',
            refreshReadyText: '放下刷新！',
            float: false,
            enableHapticFeedback: true,
          ),
          footer: ClassicalFooter(
            enableInfiniteLoad: true,
            loadText: '上拉加载',
            loadingText: '正在加载...',
            loadedText: '加载完成!',
            loadFailedText: '加载失败！',
            noMoreText: '暂无更多数据',
            infoText: '更新于 %T',
            enableHapticFeedback: true,
          ),
          child: ListView(
            padding: EdgeInsets.only(top: ScreenAdaper.height(12)),
            controller: _scrollController,
            children: <Widget>[this._productListWidget()],
          ),
          onLoad: () async {
            await Future.delayed(Duration(seconds: 2), () {
              setState(() {
                this._getProduct();
              });
              _controller.finishLoad(noMore: !this._hasMore);
            });
          },
        ),
      ),
    );
  }
}
