import 'package:intl/intl.dart';

extension IntExtension on int {
  String formatCurrency() {
    return NumberFormat('#,##0', 'en_US').format(this);
  }
}
