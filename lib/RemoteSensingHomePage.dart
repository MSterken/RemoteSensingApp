import 'package:flutter/material.dart';

import 'dataManager.dart';
import 'formpage/formPage.dart';
import 'librarypage/libraryPage.dart';
import 'mappage/mapPage.dart';

class RemoteSensingHomePage extends StatefulWidget {
  const RemoteSensingHomePage({super.key, required this.title, required this.dataManager});

  final String title;
  final DataManager dataManager;

  @override
  State<RemoteSensingHomePage> createState() => _RemoteSensingHomePageState(dataManager);
}




class _RemoteSensingHomePageState extends State<RemoteSensingHomePage> with SingleTickerProviderStateMixin {
  int _currentPageIndex = 0;

  late TabController _tabController;
  late DataManager dataManager;

  _RemoteSensingHomePageState(this.dataManager);



  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      setState(() {
        _currentPageIndex = _tabController.index;
      });
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          bottom:  TabBar(
            controller: _tabController,
            tabs: const <Widget>[
              ImageIcon(
                AssetImage("assets/images/hut.png"),
                size: 40,
              ),
              ImageIcon(
                AssetImage("assets/images/map.png"),
                size: 40,
              ),
              ImageIcon(
                  AssetImage("assets/images/book.png"),
                  size: 40
              )
            ],
          ),
          title: Text(widget.title),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            FormPage(dataManager),
            mapPage(),
            libraryPage(dataManager)
          ],
        )
    );
  }
}