class Direction {
  String distance;
  Duration time;
  bool exceptUnAccessible = false;

  Direction(this.distance, this.time);

  Direction.fromJson(Map<String, dynamic> json, bool exUnAccessible)
      : distance = json['distance'],
        time = Duration(seconds: json['time']),
        exceptUnAccessible = exUnAccessible;
}
