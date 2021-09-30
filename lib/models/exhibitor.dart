import 'package:expofp/models/booth.dart';

class Exhibitor {
  String id;
  String name;
  String description;
  List<Booth> booths;

  Exhibitor(this.id, this.name, this.description, this.booths);

  Exhibitor.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = "Exhibitor profile",
        booths = List<Booth>.from(json['booths'].map((model) => Booth.fromJson(model)));
}