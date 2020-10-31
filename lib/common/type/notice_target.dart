import '../constants/constants.dart';

/// NoticeTargetType
enum NoticeTargetType {
  all, clinic, appUser,
}

extension NoticeTargetTypeExtension on NoticeTargetType {
  int get rawValue {
    switch (this) {
      case NoticeTargetType.all:
        return noticeTargetAll;
      case NoticeTargetType.clinic:
        return noticeTargetClinic;
      case NoticeTargetType.appUser:
        return noticeTargetAppUser;
    }
    return -1;
  }
}

extension NoticeTargetExtension on int {
  NoticeTargetType get toNoticeTargetType {
    switch (this) {
      case noticeTargetAll:
        return NoticeTargetType.all;
      case noticeTargetClinic:
        return NoticeTargetType.clinic;
      case noticeTargetAppUser:
        return NoticeTargetType.appUser;
    }
    return null;
  }
}