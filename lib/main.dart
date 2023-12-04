import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remote_sensing_helper/dataManager.dart';
import 'appTheme.dart';
import 'libraryPage.dart';
import 'mapPage.dart';
import 'formPage.dart';
import 'remotesensingpalette.dart';

void main() {
  runApp(const RemoteSensingHelper());
}

class RemoteSensingHelper extends StatelessWidget {
  const RemoteSensingHelper({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // 1. Provide AppTheme above the MaterialApp,
      // so it will be available on all pages.
      create: (_) => AppTheme(),
      builder: (context, _) => MaterialApp(
        title: 'Remote Sensing Helper',
        // 2. Provide light theme.
        theme: ThemeData(
          primarySwatch: remoteSensingPalette,

        ),

        // 3. Provide dark theme.
        darkTheme: AppTheme.dark,
        // 4. Watch AppTheme changes (ThemeMode).
        themeMode: context.watch<AppTheme>().themeMode,
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(title: 'Remote Sensing Helper'),
      ),
    );
  }

}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}




class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _currentPageIndex = 0;

  late TabController _tabController;

  DataManager m = DataManager();

  @override
  void initState() {
    super.initState();
    loadDataFromFiles();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      setState(() {
        _currentPageIndex = _tabController.index;
      });
    });
  }

  void loadDataFromFiles() async {
    await m.createFormData();
    await m.createLibraryData();
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
          FormPage(m),
          mapPage(),
          libraryPage(m)
        ],
      )
    );
  }
}
