import 'package:expofp/components/map_page/map_page.dart';
import 'package:flutter/material.dart';

class MapIcon extends StatelessWidget {
  const MapIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
      Icon(Icons.map),
      Padding(padding: EdgeInsets.only(left: 4), child: Text("Map")),
    ]);
  }
}

class MapButton extends StatelessWidget {
  const MapButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 18.0,
        width: 68.0,
        child: IconButton(
            onPressed: () => Navigator.pushNamed(context, MapPage.routeName),
            icon: const MapIcon(),
            padding: const EdgeInsets.all(0.0)));
  }
}
