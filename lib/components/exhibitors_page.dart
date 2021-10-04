import 'package:expofp/common.dart';
import 'package:flutter/material.dart';
import 'package:expofp/components/controls.dart';
import 'package:expofp/components/exhibitor_page.dart';
import 'package:expofp/models/exhibitor.dart';

class ExhibitorsPage extends StatelessWidget {
  final List<Exhibitor> exhibitors;

  final ShowMapCallback showMap;

  const ExhibitorsPage(
      {Key? key, required this.exhibitors, required this.showMap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: exhibitors.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                title: Text(exhibitors[index].name,
                    style: const TextStyle(fontSize: 20)),
                leading: const Icon(Icons.grade),
                trailing: const Icon(Icons.arrow_right),
                onTap: () => Navigator.pushNamed(
                    context, ExhibitorPage.routeName,
                    arguments: exhibitors[index]));
          }),
      appBar: AppBar(
        title: const Text("Exhibitors"),
        actions: [MapButton(showMap: showMap)],
      ),
    );
  }
}
