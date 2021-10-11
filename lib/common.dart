typedef ShowMapCallback = void Function({String? booth});

typedef SelectBoothCallback = void Function(String booth);

typedef BuildDirectionCallback = void Function(String from, String to, bool exceptUnAccessibl);

typedef IconCheckBoxCallback = void Function(bool isChecked);

extension DurationEx on Duration {
  String toFormatString() {
    var seconds = inSeconds;
    final days = seconds ~/ Duration.secondsPerDay;
    seconds -= days * Duration.secondsPerDay;
    final hours = seconds ~/ Duration.secondsPerHour;
    seconds -= hours * Duration.secondsPerHour;
    final minutes = seconds ~/ Duration.secondsPerMinute;
    seconds -= minutes * Duration.secondsPerMinute;

    final List<String> tokens = [];
    if (days != 0) {
      tokens.add('${days}d');
    }
    if (tokens.isNotEmpty || hours != 0) {
      tokens.add('${hours}h');
    }
    if (tokens.isNotEmpty || minutes != 0) {
      tokens.add('${minutes}m');
    }
    tokens.add('${seconds}s');

    return tokens.join(' ');
  }
}
