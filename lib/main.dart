import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remote_sensing_helper/dataManager.dart';
import 'appTheme.dart';
import 'libraryPage.dart';
import 'mapPage.dart';
import 'formPage.dart';

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
        theme: AppTheme.light,
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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
    m.createLibraryData();
    m.createFormData();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      setState(() {
        _currentPageIndex = _tabController.index;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
          bottom:  TabBar(
            controller: _tabController,
            tabs: const <Widget>[
              ImageIcon(
                  AssetImage("assets/images/home.png")
              ),
              ImageIcon(
                  AssetImage("assets/images/world.png")
              ),
              ImageIcon(
                  AssetImage("assets/images/book.png")
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
