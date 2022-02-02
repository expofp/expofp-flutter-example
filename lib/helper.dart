import 'dart:io';

import 'package:expofp/constants.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';

class Helper {
  static Future<bool> updateFileFromUrl(String url, String filePath) async {
    try {
      final content = (await http.get(Uri.parse(url))).bodyBytes;
      var file = File(filePath);
      if (!(await file.exists())) {
        await file.create(recursive: true);
      }

      await file.writeAsBytes(content);
    } catch (ex) {
      return false;
    }

    return true;
  }

  static Future<void> updateFile(String assestPath, String filePath) async {
    var file = File(filePath);
    if (!(await file.exists())) {
      await file.create(recursive: true);
    } else {
      return;
    }

    final data = await rootBundle.load(assestPath);

    await file.writeAsBytes(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  static Future<void> update(String dir) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    final networkAvailable = connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi
        ? true
        : false;

    await updateFile('assets/index.html', '$dir/index.html');

    await updateFile('assets/expofp.js', '$dir/expofp.js');
    await updateFile('assets/floorplan.js', '$dir/floorplan.js');

    await updateFile(
        'assets/vendors~floorplan.js', '$dir/vendors~floorplan.js');
    await updateFile('assets/expofp-overlay.png', '$dir/expofp-overlay.png');

    await updateFile('assets/fonts/oswald-v17-cyrillic_latin-300.woff2',
        '$dir/fonts/oswald-v17-cyrillic_latin-300.woff2');
    await updateFile('assets/fonts/oswald-v17-cyrillic_latin-500.woff2',
        '$dir/fonts/oswald-v17-cyrillic_latin-500.woff2');

    await updateFile('assets/vendor/fa/css/fontawesome-all.min.css',
        '$dir/vendor/fa/css/fontawesome-all.min.css');

    await updateFile('assets/vendor/fa/webfonts/fa-brands-400.woff2',
        '$dir/vendor/fa/webfonts/fa-brands-400.woff2');
    await updateFile('assets/vendor/fa/webfonts/fa-light-300.woff2',
        '$dir/vendor/fa/webfonts/fa-light-300.woff2');
    await updateFile('assets/vendor/fa/webfonts/fa-regular-400.woff2',
        '$dir/vendor/fa/webfonts/fa-regular-400.woff2');
    await updateFile('assets/vendor/fa/webfonts/fa-solid-900.woff2',
        '$dir/vendor/fa/webfonts/fa-solid-900.woff2');

    await updateFile(
        'assets/vendor/perfect-scrollbar/css/perfect-scrollbar.css',
        '$dir/vendor/perfect-scrollbar/css/perfect-scrollbar.css');

    await updateFile('assets/vendor/sanitize-css/sanitize.css',
        '$dir/vendor/sanitize-css/sanitize.css');

    await updateFile('assets/locales/ar.json', '$dir/locales/ar.json');
    await updateFile('assets/locales/de.json', '$dir/locales/de.json');
    await updateFile('assets/locales/es.json', '$dir/locales/es.json');
    await updateFile('assets/locales/fr.json', '$dir/locales/fr.json');
    await updateFile('assets/locales/it.json', '$dir/locales/it.json');
    await updateFile('assets/locales/ko.json', '$dir/locales/ko.json');
    await updateFile('assets/locales/nl.json', '$dir/locales/nl.json');
    await updateFile('assets/locales/pt.json', '$dir/locales/pt.json');
    await updateFile('assets/locales/ru.json', '$dir/locales/ru.json');
    await updateFile('assets/locales/sv.json', '$dir/locales/sv.json');
    await updateFile('assets/locales/th.json', '$dir/locales/th.json');
    await updateFile('assets/locales/tr.json', '$dir/locales/tr.json');
    await updateFile('assets/locales/vi.json', '$dir/locales/vi.json');
    await updateFile('assets/locales/zh.json', '$dir/locales/zh.json');

    if (!networkAvailable ||
        !(await updateFileFromUrl('${Constants.dataUrl}/data.js', '$dir/data/data.js'))) {
      await updateFile('assets/data/data.js', '$dir/data/data.js');
    }

    if (!networkAvailable ||
        !(await updateFileFromUrl('${Constants.dataUrl}/fp.svg.js', '$dir/data/fp.svg.js'))) {
      await updateFile('assets/data/fp.svg.js', '$dir/data/fp.svg.js');
    }

    await updateFile('assets/data/demo.png', '$dir/data/demo.png');
  }
}