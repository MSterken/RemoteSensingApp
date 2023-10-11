import 'package:flutter/material.dart';
import 'libraryPage.dart';
import 'mapPage.dart';

void main() {
  runApp(const RemoteSensingHelper());
}

class RemoteSensingHelper extends StatelessWidget {
  const RemoteSensingHelper({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Remote Sensing Helper'),
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
          Text("Hier staat iets voorlopigs"),
          mapPage(),
          libraryPage()
        ],
      )
    );
  }
}
