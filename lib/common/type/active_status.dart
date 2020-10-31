import '../constants/constants.dart';

/// ActiveStatusType
enum ActiveStatusType {
  activity, suspension,
}

extension ActiveStatusTypeExtension on ActiveStatusType {
  int get rawValue {
    switch (this) {
      case ActiveStatusType.activity:
        return activeStatusActivity;
      case ActiveStatusType.suspension:
        return activeStatusSuspension;
    }
    return -1;
  }
}

extension ActiveStatusExtension on int {
  ActiveStatusType get toActiveStatusType {
    switch(this) {
      case activeStatusActivity:
        return ActiveStatusType.activity;
      case activeStatusSuspension:
        return ActiveStatusType.suspension;
    }
    return null;
  }
}