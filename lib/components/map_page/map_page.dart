import 'package:expofp/components/controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:expofp/components/map_page/booth_panel.dart';
import 'package:expofp/components/map_page/direction_panel.dart';
import 'package:expofp/models/exhibitor.dart';

class MapPage extends StatefulWidget {
  static const routeName = '/mapPage';

  final Exhibitor? exhibitor;

  final List<Exhibitor> exhibitors;

  const MapPage({Key? key, required this.exhibitors, this.exhibitor})
      : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final GlobalKey webViewKey = GlobalKey();

  late final List<ExhibitorBooth> booths;

  ExhibitorBooth? selectedBooth;
  bool showDirection = false;
  InAppWebViewController? webViewController;

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
          useShouldOverrideUrlLoading: true,
          mediaPlaybackRequiresUserGesture: false,
          javaScriptEnabled: true,
          cacheEnabled: true),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
        hardwareAcceleration: true,
        cacheMode: AndroidCacheMode.LOAD_CACHE_ELSE_NETWORK,
        databaseEnabled: true,
        domStorageEnabled: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

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

  InAppWebView getInAppWebView(Exhibitor? exhibitor) => InAppWebView(
      key: webViewKey,
      initialUrlRequest:
          //URLRequest(url: Uri.parse("https://developer.expofp.com/examples/demo.html${selectedBooth == null ? "" : "?" + selectedBooth!}")),
          URLRequest(
              url: Uri.parse(
                  "https://developer.expofp.com/examples/autumnfair.html${exhibitor == null ? "" : "?" + exhibitor.id}")),
      //URLRequest(url: Uri.parse("about:blank")),
      initialOptions: options,
      onWebViewCreated: (controller) async {
        //controller.loadData(data: html);//
        controller.addJavaScriptHandler(
            handlerName: 'onBoothClick',
            callback: (args) {
              setState(() {
                showDirection = false;
                selectedBooth = booths.firstWhere(
                    (b) => b.boothName == args.first.toString(), orElse: () {
                  var newBooth = ExhibitorBooth("None", args.first.toString());
                  booths.add(newBooth);
                  return newBooth;
                });
              });
            });
        webViewController = controller;
      });

  @override
  Widget build(BuildContext context) {
    print('############### Build MapPage');

    return Scaffold(
        appBar: AppBar(
          title: const MapIcon(),
          actions: [
            IconButton(
                onPressed: () => setState(() => showDirection = true),
                icon: const Icon(Icons.directions))
          ],
        ),
        body: SafeArea(
            child: Column(children: <Widget>[
      Expanded(
        child: Stack(
          children: [getInAppWebView(widget.exhibitor)],
        ),
      ),
      showDirection
          ? DirectionPanel(
              booths: booths,
              to: selectedBooth,
              showDirection: (String from, String to) => webViewController!
                  .evaluateJavascript(source: "selectRoute('$from', '$to')"),
              cancel: () => setState(() {
                    selectedBooth = null;
                    showDirection = false;
                  }))
          : selectedBooth == null
              ? Container()
              : BoothPanel(
                  boothName: selectedBooth!.boothName,
                  showDirection: () => setState(() => showDirection = true),
                  cancel: () => setState(() => selectedBooth = null)),
    ])));
  }
}
