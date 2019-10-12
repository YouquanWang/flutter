import 'package:flutter/material.dart';
import '../../../services/ScreenAdaper.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class UserCenterPage extends StatefulWidget {
  @override
  _UserCenterPage createState() => _UserCenterPage();
}

class _UserCenterPage extends State<UserCenterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: EasyRefresh(
            onRefresh: null,
            enableControlFinishRefresh: true,
            enableControlFinishLoad: true,
            topBouncing: false,
            bottomBouncing: false,
            taskIndependence: false,
            onLoad: null,
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdaper.width(12),
                      ScreenAdaper.height(64),
                      ScreenAdaper.width(12),
                      ScreenAdaper.height(40)),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/bg.png'),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                border: Border.all(
                                    width: 2,
                                    color: Color.fromRGBO(255, 255, 255, 0.5))),
                            child: ClipOval(
                              child: Image.network(
                                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568786047485&di=e424439ccc47ff41f8f91dda1af0d01d&imgtype=0&src=http%3A%2F%2Fwww.xihabang.com%2Fuploadfile%2F2013%2F1127%2F20131127034933696.png',
                                width: ScreenAdaper.width(56),
                                height: ScreenAdaper.height(56),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('海尔兄弟'),
                                Row(
                                  children: <Widget>[
                                    Text('ID:888888'),
                                    Container(
                                      height: ScreenAdaper.height(16),
                                      padding: EdgeInsets.only(
                                          left: ScreenAdaper.width(10),
                                          right: ScreenAdaper.width(10)),
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(255, 200, 89, 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  ScreenAdaper.height(8)))),
                                      child: Center(
                                        child: Text(
                                          'VIP1',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  251, 72, 68, 1),
                                              fontSize: ScreenAdaper.size(11)),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
