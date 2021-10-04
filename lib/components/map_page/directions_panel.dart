import 'package:expofp/common.dart';
import 'package:expofp/models/exhibitor_booth.dart';
import 'package:flutter/material.dart';
import 'package:expofp/components/map_page/map_panel.dart';

class DirectionsPanel extends StatefulWidget {
  final BuildDirectionCallback showDirection;
  final VoidCallback cancel;

  final List<ExhibitorBooth> booths;
  final ExhibitorBooth? to;

  const DirectionsPanel(
      {required this.showDirection,
      required this.cancel,
      required this.booths,
      this.to,
      Key? key})
      : super(key: key);

  @override
  _DirectionsPanelState createState() => _DirectionsPanelState();
}

class _DirectionsPanelState extends State<DirectionsPanel> {
  final GlobalKey webViewKey = GlobalKey();

  ExhibitorBooth? from;
  ExhibitorBooth? to;

  late final List<DropdownMenuItem<ExhibitorBooth>> items;

  @override
  void initState() {
    super.initState();
    to = widget.to;
    items = widget.booths
        .map((booth) => DropdownMenuItem(value: booth, child: Text(booth.name)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {   
    return MapPanel(
        header: const Padding(
            padding: EdgeInsets.only(left: 14, top: 12, bottom: 0),
            child: Text("Directions",
                textAlign: TextAlign.center, style: TextStyle(fontSize: 22))),
        child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              DropdownButton(
                  isExpanded: true,
                  value: from,
                  hint: const Text('Starting point'),
                  items: items,
                  onChanged: (ExhibitorBooth? newValue) =>
                      setState(() => from = newValue)),
              DropdownButton(
                isExpanded: true,
                value: to,
                hint: const Text('End point'),
                items: items,
                onChanged: (ExhibitorBooth? newValue) =>
                    setState(() => to = newValue),
              ),
              ElevatedButton.icon(
                  icon: const Icon(Icons.directions),
                  label: const Text('Directions'),
                  onPressed: from == null || to == null
                      ? null
                      : () =>
                          widget.showDirection(from!.boothName, to!.boothName)),
            ])),
        cancel: widget.cancel);
  }
}
