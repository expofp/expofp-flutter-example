import 'package:expofp/common.dart';
import 'package:flutter/material.dart';
import 'package:expofp/components/controls.dart';
import 'package:expofp/models/exhibitor.dart';

class ExhibitorPage extends StatelessWidget {
  static const routeName = '/exhibitorPage';

  final Exhibitor exhibitor;

  final List<Exhibitor> exhibitors;

  final ShowMapCallback showMap;

  const ExhibitorPage(
      {Key? key,
      required this.exhibitor,
      required this.exhibitors,
      required this.showMap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(exhibitor.name),
          actions: [
            MapButton(showMap: ({String? booth}) {
              showMap(booth: booth);
              Navigator.pop(context);
            })
          ],
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
                      showMap(booth: exhibitor.booths[0].name);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ]))));
  }
}
