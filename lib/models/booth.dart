class Booth {
  String id;
  String name;
  
  Booth(this.id, this.name);

  Booth.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}