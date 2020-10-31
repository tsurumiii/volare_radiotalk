extension StringExtension on String {
  DateTime toDate() => DateTime.parse(this);
  int toInt() => int.parse(this);
  double toDouble() => double.parse(this);
  bool isNewLine() => '\n' == substring(length - 1);
  String urlGetParameter(String target) {
    final list = split('&');
    var result = '';
    for (var item in list) {
      final data = item.split('=');
      if (data.length == 2) {
        if (data[0] == target) {
          result = data[1];
          break;
        }
      }
    }
    return result;
  }
}
