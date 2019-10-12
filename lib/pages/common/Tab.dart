import 'package:flutter/material.dart';
import '../home/index.dart';
import '../cart/index.dart';
import '../product/index.dart';
import '../team/index.dart';
import '../user/center/index.dart';

class Tabs extends StatefulWidget {
  @override
  _Tabs createState() => _Tabs();
}

class _Tabs extends State<Tabs> {
  PageController _pageController;
  int _currentIndex = 0;
  List<Widget> list = [
    HomePage(),
    ProductPage(),
    CartPage(),
    TeamPage(),
    UserCenterPage()
  ];
  @override
  void initState() {
    super.initState();
    this._pageController = new PageController(initialPage: this._currentIndex);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: this._pageController,
        children: this.list,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        selectedItemColor: Color.fromRGBO(251, 72, 68, 1),
        // fixedColor: Color.fromRGBO(51, 51, 51, 1),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        selectedFontSize: 12.0,
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;
            this._pageController.jumpToPage(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.home),
              title: Text('首页')),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.shop),
            title: Text('购物区'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.shopping_cart),
            title: Text('购物车'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.people),
            title: Text('我的团队'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.person),
            title: Text('会员中心'),
          )
        ],
      ),
    );
  }
}
