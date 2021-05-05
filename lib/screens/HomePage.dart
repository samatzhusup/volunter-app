import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:halyk_fund/screens/tab/SavedDataPage.dart';
import 'package:halyk_fund/util/Widgets.dart';
import 'package:halyk_fund/util/constants.dart';

import 'NotificationPage.dart';
import 'UserProfile.dart';
import 'tab/LocalDataPage.dart';

class HomePage extends StatefulWidget {
  String uId;

  HomePage({this.uId});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double expanded_height = 290;
  final double rounded_container_height = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              _buildSliverHead(),
              SliverToBoxAdapter(
                child: _buildDetail(),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            ),
            child: SizedBox(
              height: kToolbarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Badge(
                        badgeContent: Text("4",style: TextStyle(color: Colors.white),),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      NotificationPage(),
                                ));
                          },
                          child: Container(
                            margin: EdgeInsets.all(2),
                            child: Icon(
                              Icons.notifications_none,
                              color: Colors.black87,
                            ),
                          ),
                    ),
                      ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomColors.green,
        child: IconButton(
          onPressed: () {
            showSelectLangModal(context);
          },
          icon: Icon(Icons.add, color: CustomColors.white),
        ),
      ),
    );
  }

  Widget _buildSliverHead() {
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(
        expanded_height,
        rounded_container_height,
      ),
    );
  }

  Widget _buildDetail() {
    return DefaultTabController(
      length: 2,
      child: Container(
        height: 500,
        color: Colors.red,
        child: new Scaffold(
          appBar: new PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              color: Colors.white,
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TabBar(
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: CustomColors.textTitle),
                    unselectedLabelStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: CustomColors.textDesc),
                    indicatorColor: CustomColors.yellow,
                    indicatorWeight: 3.0,
                    labelPadding: EdgeInsets.all(10),
                    tabs: [Text("ЛОКАЛЬНЫЙ"), Text("СОХРАНЕННЫЙ")],
                  ),
                  Container(
                      height: 1,
                      decoration: BoxDecoration(
                        border: Border.all(color: CustomColors.line),
                      )),
                ],
              ),
            ),
          ),
          body: new TabBarView(
            children: <Widget>[
              LocalDataPage(),
              SavedDataPage(),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double rounded_container_height;

  DetailSliverDelegate(this.expandedHeight, this.rounded_container_height);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: Stack(
        children: <Widget>[
          Hero(
            tag: "assets/images/hero.png",
            child: Image.asset(
              "assets/images/hero.png",
              width: MediaQuery.of(context).size.width,
              height: expandedHeight,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: expandedHeight - rounded_container_height - shrinkOffset,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: rounded_container_height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
            ),
          ),
          Positioned(
            top: expandedHeight - 160 - shrinkOffset,
            left: 30,
            right: 30,
            child: Container(
              height: 130,
              padding: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Stack(children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          "assets/images/user.png",
                          width: 62,
                          height: 62,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Добро пожаловать!",
                            style: TextStyle(
                                color: CustomColors.textDesc,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Eldos Nurailym",
                            style: TextStyle(
                                color: CustomColors.green,
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topRight,
                  // margin: EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (BuildContext context) => UserProfile(),
                          ));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: 81,
                        height: 81,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
