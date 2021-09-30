import 'package:flutter/material.dart';
import 'package:expofp/components/controls.dart';
import 'package:expofp/components/map_page/map_page.dart';
import 'package:expofp/models/exhibitor.dart';

class ExhibitorPage extends StatelessWidget {
  static const routeName = '/exhibitorPage';

  final Exhibitor exhibitor;

  final List<Exhibitor> exhibitors;

  const ExhibitorPage(
      {Key? key, required this.exhibitor, required this.exhibitors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('############### Build ExhibitorPage ${exhibitor.name}');

    return Scaffold(
        appBar: AppBar(
          title: Text(exhibitor.name),
          actions: const [MapButton()],
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: SafeArea(
                child: Column(children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(exhibitor.description),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton.icon(
                    icon: const Icon(Icons.place, size: 18),
                    label: const Text('View on Map'),
                    onPressed: () {
                      Navigator.pushNamed(context, MapPage.routeName,
                          arguments: exhibitor);
                    },
                  ),
                ],
              ),
            ]))));
  }
}
