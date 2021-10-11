import 'dart:convert';

import 'package:expofp/components/controls.dart';
import 'package:expofp/components/map_page/direction_panel.dart';
import 'package:expofp/models/direction.dart';
import 'package:expofp/models/exhibitor_booth.dart';
import 'package:flutter/material.dart';
import 'package:expofp/components/map_page/booth_panel.dart';
import 'package:expofp/components/map_page/directions_panel.dart';
import 'package:expofp/models/exhibitor.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapPage extends StatefulWidget {
  static const routeName = '/mapPage';

  final Exhibitor? exhibitor;

  final List<Exhibitor> exhibitors;

  final VoidCallback hideMap;

  late final _MapPageState state;

  MapPage(
      {Key? key,
      required this.exhibitors,
      this.exhibitor,
      required this.hideMap})
      : super(key: key);

  @override
  _MapPageState createState() {
    state = _MapPageState();
    return state;
  }

  void selectBooth(String booth) {
    state.selectBooth(booth);
  }
}

class _MapPageState extends State<MapPage> {
  final GlobalKey webViewKey = GlobalKey();

  late final List<ExhibitorBooth> booths;

  ExhibitorBooth? selectedBooth;
  Direction? direction;
  bool showDirections = false;
  bool exceptUnAccessible = false;
  WebViewController? webViewController;

  @override
  void initState() {
    super.initState();

    booths = widget.exhibitors
        .expand((exhibitor) => exhibitor.booths
            .map((booth) => ExhibitorBooth(exhibitor.name, booth.name)))
        .toList();

    if (widget.exhibitor != null) {
      final String name =
          "${widget.exhibitor!.name} - ${widget.exhibitor!.booths[0].name}";
      selectedBooth = booths.firstWhere((booth) => booth.name == name);
    }
  }

  void setSelectedBooth(String booth) {
    setState(() {
      showDirections = false;
      direction = null;
      selectedBooth =
          booths.firstWhere((b) => b.boothName == booth, orElse: () {
        var newBooth = ExhibitorBooth("None", booth);
        booths.add(newBooth);
        return newBooth;
      });
    });
  }

  void selectBooth(String booth) {
    webViewController?.evaluateJavascript("selectBooth('$booth')");
    setSelectedBooth(booth);
  }

  void selectRoute(String from, String to, bool exceptUnAccessible) {
    webViewController?.evaluateJavascript(
        "selectRoute('$from', '$to', $exceptUnAccessible)");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: widget.hideMap,
          ),
          title: const MapIcon(),
          actions: [
            IconButton(
                onPressed: () {
                  selectRoute('', '', false);
                  setState(() {
                    direction = null;
                    showDirections = true;
                  });
                },
                icon: const Icon(Icons.directions))
          ],
        ),
        body: Column(children: <Widget>[
          Expanded(
              child: WebView(
                  initialUrl:
                      'https://developer.expofp.com/examples/autumnfair.html',
                  javascriptMode: JavascriptMode.unrestricted,
                  javascriptChannels: <JavascriptChannel>{
                    JavascriptChannel(
                        name: 'onBoothClickHandler',
                        onMessageReceived: (JavascriptMessage message) {
                          setSelectedBooth(message.message);
                        }),
                    JavascriptChannel(
                        name: 'onFpConfiguredHandler',
                        onMessageReceived: (JavascriptMessage message) {}),
                    JavascriptChannel(
                        name: 'onDirectionHandler',
                        onMessageReceived: (JavascriptMessage message) {
                          setState(() {
                            direction = Direction.fromJson(
                                jsonDecode(message.message),
                                exceptUnAccessible);
                            selectedBooth = null;
                            showDirections = false;
                          });
                        })
                  },
                  onWebViewCreated: (controller) {
                    setState(() {
                      webViewController = controller;
                    });
                  })),
          showDirections
              ? DirectionsPanel(
                  selectBooth: selectBooth,
                  booths: booths,
                  to: selectedBooth,
                  showDirection: (String from, String to, bool exUnAccessible) {
                    selectRoute(from, to, exUnAccessible);

                    setState(() {
                      exceptUnAccessible = exUnAccessible;
                      selectedBooth = null;
                      showDirections = false;
                      direction = null;
                    });
                  },
                  cancel: () => setState(() {
                        exceptUnAccessible = false;
                        selectedBooth = null;
                        showDirections = false;
                      }))
              : selectedBooth == null
                  ? direction == null
                      ? Container()
                      : DirectionPanel(
                          direction: direction!,
                          cancel: () {
                            selectRoute('', '', false);
                            setState(() => direction = null);
                          })
                  : BoothPanel(
                      booth: selectedBooth!,
                      showDirection: () =>
                          setState(() => showDirections = true),
                      cancel: () => setState(() => selectedBooth = null)),
        ]));
  }
}
