import 'package:expofp/common.dart';
import 'package:expofp/components/controls.dart';
import 'package:expofp/components/map_page/map_panel.dart';
import 'package:expofp/models/direction.dart';
import 'package:flutter/material.dart';

class DirectionPanel extends StatelessWidget {
  final Direction direction;
  final VoidCallback cancel;

  const DirectionPanel(
      {required this.direction, required this.cancel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => MapPanel(
      header: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(
                  left: 14, top: 12, bottom: 12, right: 28),
              child: DistanceIcon(distance: direction.distance, exceptUnAccessible: direction.exceptUnAccessible,)),
          TimeIcon(time:  direction.time.toFormatString()),
        ],
      ),
      cancel: cancel);
}
