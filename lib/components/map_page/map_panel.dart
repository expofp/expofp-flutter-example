import 'package:flutter/material.dart';

class MapPanel extends StatelessWidget {
  final Widget? header;

  final Widget? child;

  final VoidCallback cancel;

  const MapPanel(
      {Key? key, this.child, required this.cancel, this.header})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cancelButton =
        IconButton(icon: const Icon(Icons.close), onPressed: cancel);

    if (header != null) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [header!, cancelButton],
          ),
          child ?? Container()
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [cancelButton],
          ),
          child ?? Container()
        ],
      );
    }
  }
}
