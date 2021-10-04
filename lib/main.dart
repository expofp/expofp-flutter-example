import 'dart:async';
import 'package:expofp/components/exhibitor_page.dart';
import 'package:expofp/components/map_page/map_page.dart';
import 'package:expofp/mock_data.dart';
import 'package:expofp/models/exhibitor.dart';
import 'package:flutter/material.dart';
import 'package:expofp/components/exhibitors_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final List<Exhibitor> exhibitors;

  late final MapPage mapPage;

  bool isMapVisible = false;

  void showMap({String? booth}) {
    setState(() => isMapVisible = true);
    if (booth != null) {
      mapPage.selectBooth(booth);
    }
  }

  void hideMap() => setState(() => isMapVisible = false);

  @override
  void initState() {
    super.initState();
    exhibitors = getExhibitors();
    mapPage = MapPage(exhibitors: exhibitors, hideMap: hideMap);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Stack(children: [
          Visibility(
              visible: !isMapVisible,
              maintainState: true,
              child: ExhibitorsPage(
                showMap: showMap,
                exhibitors: exhibitors,
              )),
          Visibility(visible: isMapVisible, maintainState: true, child: mapPage)
        ]),
        onGenerateRoute: (settings) {
          if (settings.name == ExhibitorPage.routeName) {
            final args = settings.arguments as Exhibitor;
            return MaterialPageRoute(
              builder: (context) {
                return ExhibitorPage(
                  exhibitor: args,
                  exhibitors: exhibitors,
                  showMap: ({String? booth}) {
                    showMap(booth: booth);
                  },
                );
              },
            );
          }

          return MaterialPageRoute(
            builder: (context) {
              return ExhibitorsPage(
                showMap: showMap,
                exhibitors: exhibitors,
              );
            },
          );
        });
  }
}
