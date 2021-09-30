import 'dart:async';
import 'dart:io';
import 'package:expofp/components/exhibitor_page.dart';
import 'package:expofp/components/map_page/map_page.dart';
import 'package:expofp/mock_data.dart';
import 'package:expofp/models/exhibitor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:expofp/components/exhibitors_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final List<Exhibitor> exhibitors;

  @override
  void initState() {
    super.initState();
    exhibitors = getExhibitors();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(onGenerateRoute: (settings) {
      if (settings.name == ExhibitorPage.routeName) {
        final args = settings.arguments as Exhibitor;
        return MaterialPageRoute(
          builder: (context) {
            return ExhibitorPage(exhibitor: args, exhibitors: exhibitors);
          },
        );
      } else if (settings.name == MapPage.routeName) {
        return MaterialPageRoute(
          builder: (context) {
            return MapPage(
              exhibitor: settings.arguments as Exhibitor?,
              exhibitors: exhibitors,
            );
          },
        );
      }

      return MaterialPageRoute(
        builder: (context) {
          return ExhibitorsPage(
            exhibitors: exhibitors,
          );
        },
      );
    });
  }
}
