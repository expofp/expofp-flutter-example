import 'package:expofp/common.dart';
import 'package:flutter/material.dart';

class TextIcon extends StatelessWidget {
  final IconData iconData;
  final String text;
  final TextStyle? textStyle;

  const TextIcon(
      {Key? key, required this.text, required this.iconData, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Icon(iconData),
      Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(text, style: textStyle)),
    ]);
  }
}

class MapIcon extends TextIcon {
  const MapIcon({Key? key}) : super(key: key, text: "Map", iconData: Icons.map);
}

class TimeIcon extends TextIcon {
  const TimeIcon({Key? key, required String time})
      : super(
            key: key,
            text: time,
            iconData: Icons.access_time,
            textStyle: const TextStyle(fontSize: 28));
}

class DistanceIcon extends TextIcon {
  const DistanceIcon({Key? key, required String distance})
      : super(
            key: key,
            text: distance,
            iconData: Icons.directions_walk,
            textStyle: const TextStyle(fontSize: 28));
}

class MapButton extends StatelessWidget {
  final ShowMapCallback showMap;

  const MapButton({Key? key, required this.showMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 18.0,
        width: 68.0,
        child: IconButton(
            onPressed:
                showMap, //() => Navigator.pushNamed(context, MapPage.routeName),
            icon: const MapIcon(),
            padding: const EdgeInsets.all(0.0)));
  }
}
