import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remote_sensing_helper/RemoteSensingHomePage.dart';
import 'package:remote_sensing_helper/dataManager.dart';
import 'remotesensingpalette.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  DataManager dataManager = DataManager();

  @override
  void initState() {
    super.initState();
    loadDataFromFiles();
    Future.delayed(Duration(seconds: 3), () {
     Navigator.of(context).pushReplacement(MaterialPageRoute(
         builder: (_) => RemoteSensingHomePage(dataManager: dataManager, title: "Remote Sensing Helper",)));
        
    });
  }

  void loadDataFromFiles() async {
    await dataManager.createFormData();
    await dataManager.createLibraryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [remoteSensingPalette.shade100, remoteSensingPalette.shade600],
            begin: Alignment.topRight,
              end: Alignment.bottomLeft
          )
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.edit,
            size: 80,
            color: Colors.blueGrey,),
            SizedBox(
              height: 50,
              child: Text("Remote Sensing App",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontSize: 40
              ),),
            )
          ],
        ),
      ),
    );
  }


}
