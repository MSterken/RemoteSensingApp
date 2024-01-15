
import 'package:flutter/cupertino.dart';
import 'package:webviewx/webviewx.dart';

import '../mapChecker.dart';

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

  late WebViewXController webviewXController;

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
          child: Stack (
            children: [
                      WebViewX(
                      initialContent: url,
                      initialSourceType: SourceType.url,
                      onWebViewCreated: (controller) => webviewXController = controller,
                      width: MediaQuery. of(context). size. width,
                      height: 0.70 * (MediaQuery. of(context). size. height),
                      )
            ],
          )
        ),
      );
  }


}
