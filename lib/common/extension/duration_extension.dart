extension DurationExtension on Duration {
  String printTwoDigits() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final twoDigitMinutes = twoDigits(inMinutes.remainder(60).toInt());
    final twoDigitSeconds = twoDigits(inSeconds.remainder(60).toInt());
    return '${twoDigits(inHours)}:$twoDigitMinutes:$twoDigitSeconds';
  }
}
