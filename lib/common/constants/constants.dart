/// Gender
const int genderMan = 0;
const int genderWoman = 1;

/// LoginType
const int loginTypeInvalid = -1;
const int loginTypeEmail = 0;
const int loginTypePhoneNumber = 1;
const int loginTypeApple = 2;
const int loginTypeFacebook = 3;
const int loginTypeTwitter = 4;
const int loginTypeGoogle = 5;
const int loginTypeAnonymously = 6;
const int loginTypeUnknown = 100;

/// Platform
const int platformIOS = 0;
const int platformAndroid = 1;

/// UserType
const int userTypeCertified = 0; // 認定されたユーザ
const int userTypeAdmin = 1; // Admin
const int userTypeAccount = 2; // 一般的なアカウント

/// ActiveStatus
const activeStatusActivity = 0; // 利用可能
const activeStatusSuspension = 1; // 利用停止

/// ErrorCode
const String errorCodeAuthCredentialAlreadyInUse = 'credential-already-in-use';
const String errorCodeAuthProviderAlreadyLinked = 'provider-already-linked';

/// File extension
const fileExtensionJson = 'json';
const fileExtensionPng = 'png';
const fileExtensionJpeg = 'png';

/// Mime type
const mimeTypeJson = 'application/json';

/// Max file megabyte size
const int maxFileSmallSize = 5;
const int maxFileMediumSize = 10;
const int maxFileLargeSize = 100;

/// Max file count
const int maxFileCountQualification = 30;

/// Url
const String urlOfTermOfRule = '';
const String urlOfPrivacyPolicy = '';

/// NoticeTarget
const noticeTargetAll = 0; // 全てのユーザー
const noticeTargetClinic = 1; // クリニック
const noticeTargetAppUser = 2; // アプリユーザー

/// CollectionPagingListener Limit
const int initialLimit = 20;
const int pagingLimit = 20;
