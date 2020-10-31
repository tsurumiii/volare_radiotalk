import 'package:intl/intl.dart';

extension NumExtension on num {
  String commaFormat() => NumberFormat().format(this);
}

extension NumListExtension on List<num> {
  num max() {
    if (isNotEmpty) {
      if (contains(null)) {
        return -1;
      }
      final items = toList();
//      print('item $items');
      if (length > 1) {
        items.sort((a, b) => b.compareTo(a));
      }
      return items.first;
    }
    return -1;
  }
}