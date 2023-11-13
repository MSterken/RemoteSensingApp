import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'mapChecker.dart';

class MapWidget extends StatefulWidget {
  String url;
  MapChecker m;

  MapWidget(this.m, this.url,{super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState(m, url);
}

class _MapWidgetState extends State<MapWidget> {
  String url;
  MapChecker m;
  late InAppWebViewController webviewController;

  _MapWidgetState(this.m, this.url);


  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: m.mapChecks[url]!,
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        child:
        Container(
          child: InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse(url)
            ),
            onWebViewCreated: (InAppWebViewController controller) {
              webviewController = controller;
            },
          )
        ),
      );
  }


}
