import 'package:flutter/material.dart';
import 'package:expofp/components/map_page/map_panel.dart';

class BoothPanel extends StatelessWidget {
  final String boothName;

  final VoidCallback showDirection;

  final VoidCallback cancel;

  const BoothPanel(
      {required this.boothName,
      required this.showDirection,
      required this.cancel,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('############### Build BoothPanel');

    return MapPanel(
        header: Padding(
            padding: const EdgeInsets.only(left: 14, top: 12, bottom: 0),
            child: Text(boothName,
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 22))),
        child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: const EdgeInsets.only(left: 14),
                child: ElevatedButton.icon(
                    icon: const Icon(Icons.directions),
                    label: const Text('Directions'),
                    onPressed: showDirection))),
        cancel: cancel);
  }
}
