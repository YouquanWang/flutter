import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List list = [];
  int _page = 1;
  @override
  void initState() {
    super.initState();
    this._getProduct();
  }

  void _getProduct() async {
    var apiurl = 'https://v3test-xsy.dsceshi.cn/api/v1/basic/product/Listss';
    try {
      Response response;
      Dio dio = new Dio();
      response = await dio.post(apiurl, data: {
        '_order': 'w_time',
        '_sort': 0,
        'priceStart': '',
        'device': 'mobile',
        'page': this._page
      });
      setState(() {
        this.list = json.decode(response.data)["data"]["data"];
      });
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/bg.png'),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                  // centerSlice: Rect.fromLTRB(0, 0, 0,100)
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
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      ClipOval(
                        child: Image.network(
                          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568786047485&di=e424439ccc47ff41f8f91dda1af0d01d&imgtype=0&src=http%3A%2F%2Fwww.xihabang.com%2Fuploadfile%2F2013%2F1127%2F20131127034933696.png',
                          width: 20,
                          height: 20,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 180.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        // return ;
                        return ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image.network(
                            "http://via.placeholder.com/350x150",
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                      itemCount: 3,
                      pagination: SwiperPagination(),
                      // control: new SwiperControl(),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: 44,
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
                      width: 30,
                      height: 15,
                    ),
                    SizedBox(
                      width: 15,
                      height: 30,
                    ),
                    Expanded(
                      flex: 1,
                      child: Swiper(
                        containerHeight: 44,
                        itemHeight: 44,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return Align(
                              alignment: FractionalOffset.centerLeft,
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'HOT',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Theme.of(context).accentColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 3,
                                    height: 30,
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
                      width: 10,
                      height: 30,
                    ),
                    Container(
                      width: 1,
                      height: 30,
                      color: Color.fromRGBO(228, 228, 228, 1),
                    ),
                    SizedBox(
                      width: 10,
                      height: 30,
                    ),
                    SizedBox(
                      width: 14,
                      height: 14,
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
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 4,
                        height: 20,
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(2.0))),
                      ),
                      Text(
                        '购物区',
                        style: TextStyle(
                            color: Theme.of(context).textTheme.title.color,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  InkWell(
                    child: Text(
                      '更多',
                      style: TextStyle(
                          color: Color.fromRGBO(252, 132, 88, 1), fontSize: 14),
                    ),
                    onTap: () {
                      // showAlertDialog(context);
                      showSimpleDialod(context);
                      // showBottomSheet(context);
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: GridView.builder(
                shrinkWrap: true,
                primary: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 66 / 100,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                physics: NeverScrollableScrollPhysics(),
                itemCount: this.list.length,
                itemBuilder: (BuildContext context, int index) {
                  return  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.06),
                            blurRadius: 6,
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
                              this.list[index]['image'],
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
                                height: 32,
                                child: Text(
                                  "${this.list[index]['product_name']}",
                                  style: TextStyle(
                                      color: Theme.of(context).textTheme.title.color,
                                      fontSize: 13),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text.rich(
                                TextSpan(
                                    text: '¥',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).accentColor),
                                    children: [
                                      TextSpan(
                                        text: this.list[index]['sell_price'].split('.')[0],
                                        style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                Theme.of(context).accentColor),
                                      ),
                                      TextSpan(
                                        text: '.'+ this.list[index]['sell_price'].split('.')[1],
                                        style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                Theme.of(context).accentColor),
                                      )
                                    ]),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                // children: <Widget>[
                //   Container(
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(10),
                //       boxShadow: [
                //         BoxShadow(
                //             color: Color.fromRGBO(0, 0, 0, 0.06),
                //             blurRadius: 6,
                //             offset: Offset(0, 3))
                //       ],
                //     ),
                //     child: Column(
                //       children: <Widget>[
                //         ClipRRect(
                //           borderRadius: BorderRadius.only(
                //               topLeft: Radius.circular(10),
                //               topRight: Radius.circular(10)),
                //           child: AspectRatio(
                //             aspectRatio: 1,
                //             child: Image.network(
                //               'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568786047485&di=e424439ccc47ff41f8f91dda1af0d01d&imgtype=0&src=http%3A%2F%2Fwww.xihabang.com%2Fuploadfile%2F2013%2F1127%2F20131127034933696.png',
                //               fit: BoxFit.cover,
                //             ),
                //           ),
                //         ),
                //         Container(
                //           padding: EdgeInsets.all(10),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: <Widget>[
                //               Container(
                //                 height: 32,
                //                 child: Text(
                //                   'DILOVE蒂爱瑰花保险花DILOVE蒂爱瑰花保险花DILOVE蒂爱瑰花保险花DILOVE蒂爱瑰花保险花DILOVE蒂爱瑰花保险花',
                //                   style: TextStyle(
                //                       color: Theme.of(context).textTheme.title.color,
                //                       fontSize: 13),
                //                   maxLines: 2,
                //                   overflow: TextOverflow.ellipsis,
                //                 ),
                //               ),
                //               SizedBox(
                //                 height: 10,
                //               ),
                //               Text.rich(
                //                 TextSpan(
                //                     text: '¥',
                //                     style: TextStyle(
                //                         fontSize: 12,
                //                         color: Theme.of(context).accentColor),
                //                     children: [
                //                       TextSpan(
                //                         text: '100',
                //                         style: TextStyle(
                //                             fontSize: 16,
                //                             color:
                //                                 Theme.of(context).accentColor),
                //                       ),
                //                       TextSpan(
                //                         text: '.00',
                //                         style: TextStyle(
                //                             fontSize: 14,
                //                             color:
                //                                 Theme.of(context).accentColor),
                //                       )
                //                     ]),
                //               )
                //             ],
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                //   Container(
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(10),
                //       boxShadow: [
                //         BoxShadow(
                //             color: Color.fromRGBO(0, 0, 0, 0.06),
                //             blurRadius: 6,
                //             offset: Offset(0, 3))
                //       ],
                //     ),
                //     child: Column(
                //       children: <Widget>[
                //         ClipRRect(
                //           borderRadius: BorderRadius.only(
                //               topLeft: Radius.circular(10),
                //               topRight: Radius.circular(10)),
                //           child: AspectRatio(
                //             aspectRatio: 1,
                //             child: Image.network(
                //               'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568786047485&di=e424439ccc47ff41f8f91dda1af0d01d&imgtype=0&src=http%3A%2F%2Fwww.xihabang.com%2Fuploadfile%2F2013%2F1127%2F20131127034933696.png',
                //               fit: BoxFit.cover,
                //             ),
                //           ),
                //         ),
                //         Container(
                //           padding: EdgeInsets.all(10),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: <Widget>[
                //               Container(
                //                 height: 32,
                //                 child: Text(
                //                   'DILOVE蒂爱瑰花保险花',
                //                   style: TextStyle(
                //                       color: Theme.of(context).textTheme.title.color,
                //                       fontSize: 13),
                //                   maxLines: 2,
                //                   overflow: TextOverflow.ellipsis,
                //                 ),
                //               ),
                //               SizedBox(
                //                 height: 10,
                //               ),
                //               Text.rich(
                //                 TextSpan(
                //                     text: '¥',
                //                     style: TextStyle(
                //                         fontSize: 12,
                //                         color: Theme.of(context).accentColor),
                //                     children: [
                //                       TextSpan(
                //                         text: '100',
                //                         style: TextStyle(
                //                             fontSize: 16,
                //                             color:
                //                                 Theme.of(context).accentColor),
                //                       ),
                //                       TextSpan(
                //                         text: '.00',
                //                         style: TextStyle(
                //                             fontSize: 14,
                //                             color:
                //                                 Theme.of(context).accentColor),
                //                       )
                //                     ]),
                //               )
                //             ],
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                //   Container(
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(10),
                //       boxShadow: [
                //         BoxShadow(
                //             color: Color.fromRGBO(0, 0, 0, 0.06),
                //             blurRadius: 6,
                //             offset: Offset(0, 3))
                //       ],
                //     ),
                //     child: Column(
                //       children: <Widget>[
                //         ClipRRect(
                //           borderRadius: BorderRadius.only(
                //               topLeft: Radius.circular(10),
                //               topRight: Radius.circular(10)),
                //           child: AspectRatio(
                //             aspectRatio: 1,
                //             child: Image.network(
                //               'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568786047485&di=e424439ccc47ff41f8f91dda1af0d01d&imgtype=0&src=http%3A%2F%2Fwww.xihabang.com%2Fuploadfile%2F2013%2F1127%2F20131127034933696.png',
                //               fit: BoxFit.cover,
                //             ),
                //           ),
                //         ),
                //         Container(
                //           padding: EdgeInsets.all(10),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: <Widget>[
                //               Container(
                //                 height: 32,
                //                 child: Text(
                //                   'DILOVE蒂爱瑰花保险花DILOVE蒂爱瑰花保险花DILOVE蒂爱瑰花保险花DILOVE蒂爱瑰花保险花DILOVE蒂爱瑰花保险花',
                //                   style: TextStyle(
                //                       color: Theme.of(context).textTheme.title.color,
                //                       fontSize: 13),
                //                   maxLines: 2,
                //                   overflow: TextOverflow.ellipsis,
                //                 ),
                //               ),
                //               SizedBox(
                //                 height: 10,
                //               ),
                //               Text.rich(
                //                 TextSpan(
                //                     text: '¥',
                //                     style: TextStyle(
                //                         fontSize: 12,
                //                         color: Theme.of(context).accentColor),
                //                     children: [
                //                       TextSpan(
                //                         text: '100',
                //                         style: TextStyle(
                //                             fontSize: 16,
                //                             color:
                //                                 Theme.of(context).accentColor),
                //                       ),
                //                       TextSpan(
                //                         text: '.00',
                //                         style: TextStyle(
                //                             fontSize: 14,
                //                             color:
                //                                 Theme.of(context).accentColor),
                //                       )
                //                     ]),
                //               )
                //             ],
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                //   Container(
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(10),
                //       boxShadow: [
                //         BoxShadow(
                //             color: Color.fromRGBO(0, 0, 0, 0.06),
                //             blurRadius: 6,
                //             offset: Offset(0, 3))
                //       ],
                //     ),
                //     child: Column(
                //       children: <Widget>[
                //         ClipRRect(
                //           borderRadius: BorderRadius.only(
                //               topLeft: Radius.circular(10),
                //               topRight: Radius.circular(10)),
                //           child: AspectRatio(
                //             aspectRatio: 1,
                //             child: Image.network(
                //               'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568786047485&di=e424439ccc47ff41f8f91dda1af0d01d&imgtype=0&src=http%3A%2F%2Fwww.xihabang.com%2Fuploadfile%2F2013%2F1127%2F20131127034933696.png',
                //               fit: BoxFit.cover,
                //             ),
                //           ),
                //         ),
                //         Container(
                //           padding: EdgeInsets.all(10),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: <Widget>[
                //               Container(
                //                 height: 32,
                //                 child: Text(
                //                   '【今日直降】荣耀10青春版 2400万AI自拍全网最【今日直降】荣耀10青春版 2400万AI自拍全网最',
                //                   style: TextStyle(
                //                       color: Theme.of(context).textTheme.title.color,
                //                       fontSize: 13),
                //                   maxLines: 2,
                //                   overflow: TextOverflow.ellipsis,
                //                 ),
                //               ),
                //               SizedBox(
                //                 height: 10,
                //               ),
                //               Text.rich(
                //                 TextSpan(
                //                     text: '¥',
                //                     style: TextStyle(
                //                         fontSize: 12,
                //                         color: Theme.of(context).accentColor),
                //                     children: [
                //                       TextSpan(
                //                         text: '100',
                //                         style: TextStyle(
                //                             fontSize: 16,
                //                             color:
                //                                 Theme.of(context).accentColor),
                //                       ),
                //                       TextSpan(
                //                         text: '.00',
                //                         style: TextStyle(
                //                             fontSize: 14,
                //                             color:
                //                                 Theme.of(context).accentColor),
                //                       )
                //                     ]),
                //               )
                //             ],
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ],
              ),
            )
          ],
        ));
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
                  fontSize: 20.0,
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
