import 'package:expofp/models/exhibitor_booth.dart';
import 'package:flutter/material.dart';
import 'package:expofp/components/map_page/map_panel.dart';

class BoothPanel extends StatelessWidget {
  final ExhibitorBooth booth;

  final VoidCallback showDirection;

  final VoidCallback cancel;

  const BoothPanel(
      {required this.booth,
      required this.showDirection,
      required this.cancel,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MapPanel(
        header: Padding(
            padding: const EdgeInsets.only(left: 14, top: 12, bottom: 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(booth.exhibitorName,
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 22)),
              Text(booth.boothName,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 14, color: Colors.black.withOpacity(0.6)))
            ])),
        child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: const EdgeInsets.only(left: 14, top: 4),
                child: ElevatedButton.icon(
                    icon: const Icon(Icons.directions),
                    label: const Text('Directions'),
                    onPressed: showDirection))),
        cancel: cancel);
  }
}
