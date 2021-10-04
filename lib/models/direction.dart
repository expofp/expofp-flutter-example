class Direction {
  String distance;
  Duration time;

  Direction(this.distance, this.time);

  Direction.fromJson(Map<String, dynamic> json)
      : distance = json['distance'],
        time = Duration(seconds: json['time']);
}
