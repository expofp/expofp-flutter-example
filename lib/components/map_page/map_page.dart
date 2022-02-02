import 'dart:convert';
import 'dart:io';

import 'package:expofp/components/controls.dart';
import 'package:expofp/components/map_page/direction_panel.dart';
import 'package:expofp/helper.dart';
import 'package:expofp/models/direction.dart';
import 'package:expofp/models/exhibitor_booth.dart';
import 'package:flutter/material.dart';
import 'package:expofp/components/map_page/booth_panel.dart';
import 'package:expofp/components/map_page/directions_panel.dart';
import 'package:expofp/models/exhibitor.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:path_provider/path_provider.dart';

class MapPage extends StatefulWidget {
  static const routeName = '/mapPage';

  final Exhibitor? exhibitor;

  final List<Exhibitor> exhibitors;

  final VoidCallback hideMap;

  late final _MapPageState state;

  // ignore: prefer_const_constructors_in_immutables
  MapPage(
      {Key? key,
      required this.exhibitors,
      this.exhibitor,
      required this.hideMap})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _MapPageState createState() {
    state = _MapPageState();
    return state;
  }

  void selectBooth(String booth) {
    state.setSelectedBooth(booth);
  }
}

class _MapPageState extends State<MapPage> {
  final GlobalKey webViewKey = GlobalKey();

  late final List<ExhibitorBooth> booths;

  ExhibitorBooth? selectedBooth;
  Direction? direction;
  bool showDirections = false;
  bool exceptUnAccessible = false;
  InAppWebViewController? webViewController;

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

    selectBooth(booth);
  }

  void selectBooth(String booth) {
    webViewController?.evaluateJavascript(source: "selectBooth('$booth')");
  }

  void selectRoute(String from, String to, bool exceptUnAccessible) {
    webViewController?.evaluateJavascript(
        source: "selectRoute('$from', '$to', $exceptUnAccessible)");
  }

  void setCurrentPosition(int x, int y, bool focus) {
    webViewController?.evaluateJavascript(
        source: "setCurrentPosition($x, $y, $focus)");
  }

  Future<void> initController(InAppWebViewController controller, String dir) async {
    await Helper.update(dir);
    await controller.loadUrl(urlRequest: URLRequest(url: Uri.parse('file:///$dir/index.html')));
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
            child: InAppWebView(
              initialOptions: InAppWebViewGroupOptions(
                  android: AndroidInAppWebViewOptions(
                      allowFileAccess: true,
                      domStorageEnabled: true,
                      allowContentAccess: true),
                  crossPlatform: InAppWebViewOptions(
                      allowUniversalAccessFromFileURLs: true,
                      javaScriptEnabled: true,
                      allowFileAccessFromFileURLs: true)),
              onConsoleMessage: (InAppWebViewController controller,
                  ConsoleMessage consoleMessage) {},
              onWebViewCreated: (InAppWebViewController controller) {
                getApplicationDocumentsDirectory().then((result) async {
                  await initController(controller, result.path);

                  controller.addJavaScriptHandler(
                      handlerName: 'onBoothClick',
                      callback: (args) {
                        setSelectedBooth(args[0]);
                      });

                  controller.addJavaScriptHandler(
                      handlerName: 'onFpConfigured', callback: (args) {});

                  controller.addJavaScriptHandler(
                      handlerName: 'onDirection',
                      callback: (args) {
                        final newDirection = Direction.fromJson(
                            jsonDecode(args[0]), exceptUnAccessible);
                        setState(() {
                          direction = newDirection.time == Duration.zero &&
                                  newDirection.distance == '0m'
                              ? null
                              : newDirection;
                          selectedBooth = null;
                          showDirections = false;
                        });
                      });

                  controller.addJavaScriptHandler(
                      handlerName: 'readFile',
                      callback: (args) {
                        return File('${result.path}/${args[0]}')
                            .readAsStringSync();
                      });

                  setState(() {
                    webViewController = controller;
                  });

                  if (Platform.isIOS) {
                    await controller.reload();
                  }
                });
              },
            ),
          ),
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
