import 'package:flutter/material.dart';
import '../../../services/ScreenAdaper.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class UserCenterPage extends StatefulWidget {
  @override
  _UserCenterPage createState() => _UserCenterPage();
}

class _UserCenterPage extends State<UserCenterPage> {
  double itemWidth = (ScreenAdaper.getScreenWidth() - ScreenAdaper.width(38)) / 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Theme.of(context).backgroundColor,
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
                  padding: EdgeInsets.fromLTRB(ScreenAdaper.width(12),
                      ScreenAdaper.width(30), ScreenAdaper.width(12), 0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/user_bg.png'),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Align(
                        child: Text(
                          '设置',
                          style: TextStyle(
                              color: Theme.of(context).accentTextTheme.title.color,
                              fontSize: ScreenAdaper.size(14)),
                        ),
                        alignment: Alignment.centerRight,
                      ),
                      SizedBox(
                        height: ScreenAdaper.width(15),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin:
                                EdgeInsets.only(right: ScreenAdaper.width(10)),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                border: Border.all(
                                    width: 2,
                                    color: Color.fromRGBO(255, 255, 255, 0.5))),
                            child: ClipOval(
                              child: Image.network(
                                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568786047485&di=e424439ccc47ff41f8f91dda1af0d01d&imgtype=0&src=http%3A%2F%2Fwww.xihabang.com%2Fuploadfile%2F2013%2F1127%2F20131127034933696.png',
                                width: ScreenAdaper.width(56),
                                height: ScreenAdaper.width(56),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '海尔兄弟',
                                  style: TextStyle(
                                      color: Theme.of(context).accentTextTheme.title.color,
                                      fontSize: ScreenAdaper.size(16)),
                                ),
                                SizedBox(
                                  height: ScreenAdaper.height(5),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'ID:888888',
                                      style: TextStyle(
                                          color:Theme.of(context).accentTextTheme.title.color,
                                          fontSize: ScreenAdaper.size(14)),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: ScreenAdaper.width(10)),
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
                      ),
                      Container(
                        margin: EdgeInsets.only(top: ScreenAdaper.width(40)),
                        padding: EdgeInsets.fromLTRB(
                            ScreenAdaper.width(5),
                            ScreenAdaper.width(20),
                            ScreenAdaper.width(5),
                            ScreenAdaper.width(20)),
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
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    'images/pay_wait.png',
                                    width: ScreenAdaper.width(28),
                                    height: ScreenAdaper.width(28),
                                  ),
                                  SizedBox(
                                    height: ScreenAdaper.height(10),
                                  ),
                                  Text(
                                    '待支付',
                                    style: TextStyle(
                                        fontSize: ScreenAdaper.size(12),
                                        color: Theme.of(context).textTheme.title.color),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    'images/fahuo_wait.png',
                                    width: ScreenAdaper.width(28),
                                    height: ScreenAdaper.width(28),
                                  ),
                                  SizedBox(
                                    height: ScreenAdaper.height(10),
                                  ),
                                  Text(
                                    '待发货',
                                    style: TextStyle(
                                        fontSize: ScreenAdaper.size(12),
                                        color: Theme.of(context).textTheme.title.color),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    'images/shouhuo_wait.png',
                                    width: ScreenAdaper.width(28),
                                    height: ScreenAdaper.width(28),
                                  ),
                                  SizedBox(
                                    height: ScreenAdaper.height(10),
                                  ),
                                  Text(
                                    '待收货',
                                    style: TextStyle(
                                        fontSize: ScreenAdaper.size(12),
                                        color: Theme.of(context).textTheme.title.color),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    'images/order_total.png',
                                    width: ScreenAdaper.width(28),
                                    height: ScreenAdaper.width(28),
                                  ),
                                  SizedBox(
                                    height: ScreenAdaper.height(10),
                                  ),
                                  Text(
                                    '全部订单',
                                    style: TextStyle(
                                        fontSize: ScreenAdaper.size(12),
                                        color: Theme.of(context).textTheme.title.color),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenAdaper.height(20), bottom: ScreenAdaper.height(14)),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.0))),
                          ),
                          Text(
                            '我的钱包',
                            style: TextStyle(
                                color: Theme.of(context).textTheme.title.color,
                                fontSize: ScreenAdaper.size(18),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      InkWell(
                        child: Text(
                          '资产管理',
                          style: TextStyle(
                              color: Color.fromRGBO(252, 132, 88, 1),
                              fontSize: ScreenAdaper.size(14)),
                        ),
                        onTap: () {},
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: ScreenAdaper.width(12),
                      right: ScreenAdaper.width(12)),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        ScreenAdaper.width(5), 0, ScreenAdaper.width(5), 0),
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
                    child: Wrap(
                      children: <Widget>[
                        Container(
                          width: this.itemWidth,
                          margin: EdgeInsets.only(
                              top: ScreenAdaper.height(12),
                              bottom: ScreenAdaper.height(12)),
                          child: Column(
                            children: <Widget>[
                              Text.rich(TextSpan(
                                  text: '1024',
                                  style: TextStyle(
                                      fontSize: ScreenAdaper.size(16),
                                      color: Theme.of(context).textTheme.title.color),
                                  children: [
                                    TextSpan(
                                      text: '.00',
                                      style: TextStyle(
                                          fontSize: ScreenAdaper.size(13),
                                          color: Theme.of(context).textTheme.title.color),
                                    )
                                  ])),
                              SizedBox(
                                height: ScreenAdaper.height(5),
                              ),
                              Text(
                                '现金积分',
                                style: TextStyle(
                                    fontSize: ScreenAdaper.size(12),
                                    color: Theme.of(context).textTheme.subtitle.color),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: this.itemWidth,
                          margin: EdgeInsets.only(
                              top: ScreenAdaper.height(12),
                              bottom: ScreenAdaper.height(12)),
                          child: Column(
                            children: <Widget>[
                              Text.rich(TextSpan(
                                  text: '1024',
                                  style: TextStyle(
                                      fontSize: ScreenAdaper.size(16),
                                      color: Theme.of(context).textTheme.title.color),
                                  children: [
                                    TextSpan(
                                      text: '.00',
                                      style: TextStyle(
                                          fontSize: ScreenAdaper.size(13),
                                          color: Theme.of(context).textTheme.title.color),
                                    )
                                  ])),
                              SizedBox(
                                height: ScreenAdaper.height(5),
                              ),
                              Text(
                                '配额积分',
                                style: TextStyle(
                                    fontSize: ScreenAdaper.size(12),
                                    color: Theme.of(context).textTheme.subtitle.color),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: this.itemWidth,
                          margin: EdgeInsets.only(
                              top: ScreenAdaper.height(12),
                              bottom: ScreenAdaper.height(12)),
                          child: Column(
                            children: <Widget>[
                              Text.rich(TextSpan(
                                  text: '1024',
                                  style: TextStyle(
                                      fontSize: ScreenAdaper.size(16),
                                      color: Theme.of(context).textTheme.title.color),
                                  children: [
                                    TextSpan(
                                      text: '.00',
                                      style: TextStyle(
                                          fontSize: ScreenAdaper.size(13),
                                          color: Theme.of(context).textTheme.title.color),
                                    )
                                  ])),
                              SizedBox(
                                height: ScreenAdaper.height(5),
                              ),
                              Text(
                                '收益积分',
                                style: TextStyle(
                                    fontSize: ScreenAdaper.size(12),
                                    color: Theme.of(context).textTheme.subtitle.color),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: this.itemWidth,
                          margin: EdgeInsets.only(
                              top: ScreenAdaper.height(12),
                              bottom: ScreenAdaper.height(12)),
                          child: Column(
                            children: <Widget>[
                              Text.rich(TextSpan(
                                  text: '1024',
                                  style: TextStyle(
                                      fontSize: ScreenAdaper.size(16),
                                      color: Theme.of(context).textTheme.title.color),
                                  children: [
                                    TextSpan(
                                      text: '.00',
                                      style: TextStyle(
                                          fontSize: ScreenAdaper.size(13),
                                          color: Theme.of(context).textTheme.title.color),
                                    )
                                  ])),
                              SizedBox(
                                height: ScreenAdaper.height(5),
                              ),
                              Text(
                                '销售积分',
                                style: TextStyle(
                                    fontSize: ScreenAdaper.size(12),
                                    color: Theme.of(context).textTheme.subtitle.color),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: this.itemWidth,
                          margin: EdgeInsets.only(
                              top: ScreenAdaper.height(12),
                              bottom: ScreenAdaper.height(12)),
                          child: Column(
                            children: <Widget>[
                              Text.rich(TextSpan(
                                  text: '1024',
                                  style: TextStyle(
                                      fontSize: ScreenAdaper.size(16),
                                      color: Theme.of(context).textTheme.title.color),
                                  children: [
                                    TextSpan(
                                      text: '.00',
                                      style: TextStyle(
                                          fontSize: ScreenAdaper.size(13),
                                          color: Theme.of(context).textTheme.title.color),
                                    )
                                  ])),
                              SizedBox(
                                height: ScreenAdaper.height(5),
                              ),
                              Text(
                                '购物券',
                                style: TextStyle(
                                    fontSize: ScreenAdaper.size(12),
                                    color: Theme.of(context).textTheme.subtitle.color),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: this.itemWidth,
                          margin: EdgeInsets.only(
                              top: ScreenAdaper.height(12),
                              bottom: ScreenAdaper.height(12)),
                          child: Column(
                            children: <Widget>[
                              Text.rich(TextSpan(
                                  text: '1024',
                                  style: TextStyle(
                                      fontSize: ScreenAdaper.size(16),
                                      color: Theme.of(context).textTheme.title.color),
                                  children: [
                                    TextSpan(
                                      text: '.00',
                                      style: TextStyle(
                                          fontSize: ScreenAdaper.size(13),
                                          color: Theme.of(context).textTheme.title.color),
                                    )
                                  ])),
                              SizedBox(
                                height: ScreenAdaper.height(5),
                              ),
                              Text(
                                '冻结配额',
                                style: TextStyle(
                                    fontSize: ScreenAdaper.size(12),
                                    color: Theme.of(context).textTheme.subtitle.color),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: this.itemWidth,
                          margin: EdgeInsets.only(
                              top: ScreenAdaper.height(12),
                              bottom: ScreenAdaper.height(12)),
                          child: Column(
                            children: <Widget>[
                              Text.rich(TextSpan(
                                  text: '1024',
                                  style: TextStyle(
                                      fontSize: ScreenAdaper.size(16),
                                      color: Theme.of(context).textTheme.title.color),
                                  children: [
                                    TextSpan(
                                      text: '.00',
                                      style: TextStyle(
                                          fontSize: ScreenAdaper.size(13),
                                          color: Theme.of(context).textTheme.title.color),
                                    )
                                  ])),
                              SizedBox(
                                height: ScreenAdaper.height(5),
                              ),
                              Text(
                                '红包券',
                                style: TextStyle(
                                    fontSize: ScreenAdaper.size(12),
                                    color: Theme.of(context).textTheme.subtitle.color),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: this.itemWidth,
                          margin: EdgeInsets.only(
                              top: ScreenAdaper.height(12),
                              bottom: ScreenAdaper.height(12)),
                          child: Column(
                            children: <Widget>[
                              Text.rich(TextSpan(
                                  text: '1024',
                                  style: TextStyle(
                                      fontSize: ScreenAdaper.size(16),
                                      color: Theme.of(context).textTheme.title.color),
                                  children: [
                                    TextSpan(
                                      text: '.00',
                                      style: TextStyle(
                                          fontSize: ScreenAdaper.size(13),
                                          color: Theme.of(context).textTheme.title.color),
                                    )
                                  ])),
                              SizedBox(
                                height: ScreenAdaper.height(5),
                              ),
                              Text(
                                '累计业绩',
                                style: TextStyle(
                                    fontSize: ScreenAdaper.size(12),
                                    color: Theme.of(context).textTheme.subtitle.color),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenAdaper.height(10),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: ScreenAdaper.width(12),
                      right: ScreenAdaper.width(12)),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        ScreenAdaper.width(5), ScreenAdaper.width(5), ScreenAdaper.width(5),ScreenAdaper.width(5)),
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
                    child: Wrap(
                      children: <Widget>[
                        Container(
                          width: this.itemWidth,
                          margin: EdgeInsets.only(
                              top: ScreenAdaper.height(12),
                              bottom: ScreenAdaper.height(12)),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                'images/pay_wait.png',
                                width: ScreenAdaper.width(24),
                                height: ScreenAdaper.width(24),
                              ),
                              SizedBox(
                                height: ScreenAdaper.height(8),
                              ),
                              Text(
                                '业务管理',
                                style: TextStyle(
                                    fontSize: ScreenAdaper.size(12),
                                    color: Theme.of(context).textTheme.subhead.color),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: this.itemWidth,
                          margin: EdgeInsets.only(
                              top: ScreenAdaper.height(12),
                              bottom: ScreenAdaper.height(12)),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                'images/myteam.png',
                                width: ScreenAdaper.width(24),
                                height: ScreenAdaper.width(24),
                              ),
                              SizedBox(
                                height: ScreenAdaper.height(8),
                              ),
                              Text(
                                '我的团队',
                                style: TextStyle(
                                    fontSize: ScreenAdaper.size(12),
                                    color: Theme.of(context).textTheme.subhead.color),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: this.itemWidth,
                          margin: EdgeInsets.only(
                              top: ScreenAdaper.height(12),
                              bottom: ScreenAdaper.height(12)),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                'images/jiangjin.png',
                                width: ScreenAdaper.width(24),
                                height: ScreenAdaper.width(24),
                              ),
                              SizedBox(
                                height: ScreenAdaper.height(8),
                              ),
                              Text(
                                '奖金收益',
                                style: TextStyle(
                                    fontSize: ScreenAdaper.size(12),
                                    color: Theme.of(context).textTheme.subhead.color),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: this.itemWidth,
                          margin: EdgeInsets.only(
                              top: ScreenAdaper.height(12),
                              bottom: ScreenAdaper.height(12)),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                'images/tixian.png',
                                width: ScreenAdaper.width(24),
                                height: ScreenAdaper.width(24),
                              ),
                              SizedBox(
                                height: ScreenAdaper.height(8),
                              ),
                              Text(
                                '钱包提现',
                                style: TextStyle(
                                    fontSize: ScreenAdaper.size(12),
                                    color: Theme.of(context).textTheme.subhead.color),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: this.itemWidth,
                          margin: EdgeInsets.only(
                              top: ScreenAdaper.height(12),
                              bottom: ScreenAdaper.height(12)),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                'images/zhuanhuan.png',
                                width: ScreenAdaper.width(24),
                                height: ScreenAdaper.width(24),
                              ),
                              SizedBox(
                                height: ScreenAdaper.height(8),
                              ),
                              Text(
                                '货币转账',
                                style: TextStyle(
                                    fontSize: ScreenAdaper.size(12),
                                    color: Theme.of(context).textTheme.subhead.color),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: this.itemWidth,
                          margin: EdgeInsets.only(
                              top: ScreenAdaper.height(12),
                              bottom: ScreenAdaper.height(12)),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                'images/chongzhi.png',
                                width: ScreenAdaper.width(24),
                                height: ScreenAdaper.width(24),
                              ),
                              SizedBox(
                                height: ScreenAdaper.height(8),
                              ),
                              Text(
                                '充值中心',
                                style: TextStyle(
                                    fontSize: ScreenAdaper.size(12),
                                    color: Theme.of(context).textTheme.subhead.color),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: this.itemWidth,
                          margin: EdgeInsets.only(
                              top: ScreenAdaper.height(12),
                              bottom: ScreenAdaper.height(12)),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                'images/xinxi.png',
                                width: ScreenAdaper.width(24),
                                height: ScreenAdaper.width(24),
                              ),
                              SizedBox(
                                height: ScreenAdaper.height(8),
                              ),
                              Text(
                                '信息管理',
                                style: TextStyle(
                                    fontSize: ScreenAdaper.size(12),
                                    color: Theme.of(context).textTheme.subhead.color),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: this.itemWidth,
                          margin: EdgeInsets.only(
                              top: ScreenAdaper.height(12),
                              bottom: ScreenAdaper.height(12)),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                'images/bank.png',
                                width: ScreenAdaper.width(24),
                                height: ScreenAdaper.width(24),
                              ),
                              SizedBox(
                                height: ScreenAdaper.height(8),
                              ),
                              Text(
                                '银行卡',
                                style: TextStyle(
                                    fontSize: ScreenAdaper.size(12),
                                    color: Theme.of(context).textTheme.subhead.color),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                 SizedBox(
                  height: ScreenAdaper.height(10),
                ),
              ],
            ),
          )),
    );
  }
}
