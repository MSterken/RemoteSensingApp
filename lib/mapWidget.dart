import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/gestures.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webviewx/webviewx.dart';

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
  bool isPC = false;
  bool isDevice = false;

  late InAppWebViewController webviewController;
  late WebViewXController webviewXController;

  _MapWidgetState(this.m, this.url);


  @override
  void initState() {

    if(kIsWeb){
      print('reaches pc');
      isPC = true;
    } else {
      print('Reaches device');
      isDevice = true;
    }
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
          child: Stack (
            children: [
              isDevice ? InAppWebView(
                  gestureRecognizers: Set()..add(Factory<VerticalDragGestureRecognizer>(() => VerticalDragGestureRecognizer())),
                  initialUrlRequest: URLRequest(
                      url: Uri.parse(url)
                  ),
                  onWebViewCreated: (InAppWebViewController controller) {
                    webviewController = controller;
                  },
                  androidOnGeolocationPermissionsShowPrompt:
                      (InAppWebViewController controller, String origin) async {
                    return GeolocationPermissionShowPromptResponse(
                        origin: origin,
                        allow: true,
                        retain: true
                    );
                  }) : Container(),
                     isPC ? WebViewX(
                      initialContent: url,
                      initialSourceType: SourceType.url,
                      onWebViewCreated: (controller) => webviewXController = controller,
                      width: MediaQuery. of(context). size. width,
                      height: 0.70 * (MediaQuery. of(context). size. height),
                      ) : Container()

            ],
          )
        ),
      );
  }


}
