import 'package:intl/intl.dart';

mixin Messages {
  String get hello => Intl.message('こんにちは', name: 'hello');
  String get close => Intl.message('閉じる', name: 'close');
  String get yes => Intl.message('はい', name: 'yes');
  String get no => Intl.message('いいえ', name: 'no');
  String get account => Intl.message('アカウント', name: 'account');
  String get emailAddress => Intl.message('Email', name: 'emailAddress');
  String get password => Intl.message('Password', name: 'password');
  String get login => Intl.message('ログイン', name: 'login');
  String get logout => Intl.message('ログアウト', name: 'logout');
  String get google => Intl.message('Google', name: 'google');
  String get facebook => Intl.message('Facebook', name: 'facebook');
  String get apple => Intl.message('Apple', name: 'apple');
  String loginWith(String value) =>
      Intl.message('Sign in with $value', name: 'loginWith', args: [value]);
  String get next => Intl.message('次へ', name: 'next');
  String get save => Intl.message('保存', name: 'save');
  String get saving => Intl.message('保存', name: 'saving');
  String get preserve => Intl.message('保存する', name: 'preserve');
  String get name => Intl.message('名前', name: 'name');
  String get profile => Intl.message('プロフィール', name: 'profile');
  String get help => Intl.message('ヘルプ', name: 'help');
  String get selfIntroduction => Intl.message('自己紹介', name: 'selfIntroduction');
  String get search => Intl.message('検索', name: 'search');
  String get privacyPolicy => Intl.message('プライバシーポリシー', name: 'privacyPolicy');
  String get termOfRules => Intl.message('利用規約', name: 'termOfRules');
  String get setting => Intl.message('設定', name: 'setting');
  String get settingDeleteAccount =>
      Intl.message('退会', name: 'settingDeleteAccount');
  String get executeDeleteAccount =>
      Intl.message('退会する', name: 'executeDeleteAccount');
  String get appVersion => Intl.message('アプリバージョン', name: 'appVersion');
  String get loginStatus => Intl.message('ログイン状態', name: 'loginStatus');
  String get loginStatusNo => Intl.message('ログインしてください', name: 'loginStatusNo');
  String get logoutConfirm => Intl.message('ログアウトしますか？', name: 'logoutConfirm');
  String get reviewKana => Intl.message('レビュー', name: 'reviewKana');
  String get appReviewTitle => Intl.message('アプリのレビュー', name: 'appReviewTitle');
  String get appReviewDescription =>
      Intl.message('アプリのレビューをお願いします。', name: 'appReviewDescription');
  String get registerWithPhoneNumber =>
      Intl.message('電話番号で登録', name: 'registerWithPhoneNumber');
  String get createAccountWithPhone =>
      Intl.message('電話番号でアカウントを作成できます。', name: 'createAccountWithPhone');
  String get country => Intl.message('国　', name: 'country');
  String get plus81 => Intl.message('+81', name: 'plus81');
  String get number => Intl.message('数字', name: 'number');
  String get phoneNumber => Intl.message('電話番号', name: 'phoneNumber');
  String get confirm => Intl.message('確認', name: 'confirm');
  String get confirmPhoneNumber =>
      Intl.message('電話番号の確認', name: 'confirmPhoneNumber');
  String get enterSmsCode =>
      Intl.message('SMSで届いた番号を入力してください。', name: 'enterSmsCode');
  String get verification => Intl.message('認証する', name: 'verification');
  String get resendSms => Intl.message('SMSを再送する', name: 'resendSms');
  String get editProfile => Intl.message('プロフィール編集', name: 'editProfile');
  String get review => Intl.message('評価', name: 'review');
  String get totalWork => Intl.message('合計業務時間', name: 'totalWork');
  String get penalty => Intl.message('ペナルティ', name: 'penalty');
  String get registerAndChangeAccountInfo =>
      Intl.message('口座情報登録・変更', name: 'registerAndChangeAccountInfo');
  String get pastWorkList => Intl.message('過去業務一覧', name: 'pastWorkList');
  String get registerVerification =>
      Intl.message('本人確認書類登録', name: 'registerVerification');
  String get registeredIdentification =>
      Intl.message('登録済み本人確認書類', name: 'registeredIdentification');
  String get selectIdentification =>
      Intl.message('本人確認書類を選択してください', name: 'selectIdentification');
  String get registerPossessionLicense =>
      Intl.message('所有資格登録', name: 'registerPossessionLicense');
  String get registerResume => Intl.message('履歴書登録', name: 'registerResume');
  String get myPage => Intl.message('マイページ', name: 'myPage');
  String get confirmed => Intl.message('確認済', name: 'confirmed');
  String get qrScanner => Intl.message('QRスキャン', name: 'qrScanner');
  String get favorite => Intl.message('お気に入り', name: 'favorite');
  String get lookFor => Intl.message('探す', name: 'lookFor');
  String get add => Intl.message('追加', name: 'add');
  String get reRegister => Intl.message('再登録', name: 'reRegister');
  String get register => Intl.message('登録', name: 'register');
  String get confirmLicense => Intl.message('所有資格登録確認', name: 'confirmLicense');
  String get shootFrontOfLicense =>
      Intl.message('資格免許証のオモテ面全体を撮影してください。', name: 'shootFrontOfLicense');
  String get shootFrontOfIdentification =>
      Intl.message('本人確認書類のオモテ面全体を撮影してください。',
          name: 'shootFrontOfIdentification');
  String get mustShootAll =>
      Intl.message('※必ず免許証の原本全体を撮影してください', name: 'mustShootAll');
  String get mustShootIdentification =>
      Intl.message('※必ず本人確認書類の原本を撮影してください', name: 'mustShootIdentification');
  String get registerLicense => Intl.message('資格登録', name: 'registerLicense');
  String get pleaseSelectLicense =>
      Intl.message('登録資格の種類を選択してください。\n該当する資格がない場合は、その他に資格名を記入してください。',
          name: 'pleaseSelectLicense');
  String get etc => Intl.message('その他', name: 'etc');
  String get shootLicense => Intl.message('免許証を撮影する', name: 'shootLicense');
  String get shoot => Intl.message('撮影する', name: 'shoot');
  String get selectLibrary => Intl.message('ライブラリから選択', name: 'selectLibrary');
  String get firstName => Intl.message('性', name: 'firstName');
  String get lastName => Intl.message('名', name: 'lastName');
  String get sex => Intl.message('性別', name: 'sex');
  String get birth => Intl.message('生年月日', name: 'birth');
  String get email => Intl.message('メールアドレス', name: 'email');
  String get prefecture => Intl.message('都道府県', name: 'prefecture');
  String get locationAddress => Intl.message('住所', name: 'locationAddress');
  String get clinicalExperienceYears =>
      Intl.message('臨床経験年数', name: 'clinicalExperienceYears');
  String get lastWorkplace => Intl.message('最終職歴', name: 'lastWorkplace');
  String get currentWorkplace =>
      Intl.message('現在の勤務先', name: 'currentWorkplace');
  String get tel => Intl.message('電話番号', name: 'tel');
  String get required => Intl.message('必須', name: 'required');
  String get editProfileImage =>
      Intl.message('プロフィール写真を変更', name: 'editProfileImage');
  String get smsCodeTitle => Intl.message('SMSの再送', name: 'smsCodeTitle');
  String get smsCodeDescription =>
      Intl.message('SMSコードを再送しました。', name: 'smsCodeDescription');
  String get error => Intl.message('エラー', name: 'error');
  String get errorNothingEmail =>
      Intl.message('メールアドレスを入力してください。', name: 'errorNothingEmail');
  String get errorPhoneNumber =>
      Intl.message('電話番号を入力してください。', name: 'errorPhoneNumber');
  String get errorUnknown => Intl.message('不明なエラーです。', name: 'errorUnknown');
  String get errorEmptyForm =>
      Intl.message('必須事項を入力してください。', name: 'errorEmptyForm');
  String get updateProfile =>
      Intl.message('アカウント情報を更新しました。', name: 'updateProfile');
  String get validateEmail =>
      Intl.message('不正なメールアドレスです', name: 'validateEmail');
  String get mustLicenseName =>
      Intl.message('免許の名称は必須です。', name: 'mustLicenseName');
  String get mustIdentificationName =>
      Intl.message('本人確認書類の名称は必須です。', name: 'mustIdentificationName');
  String failRegisterLicense(String value) =>
      Intl.message('所持免許の登録に失敗しました。登録できるファイルサイズは${value}Mバイトまでです。',
          name: 'failRegisterLicense', args: [value]);
  String get checkProperties => Intl.message('持ち物の確認', name: 'checkProperties');
  String get checkRequirements =>
      Intl.message('応募条件', name: 'checkRequirements');
  String get neededLicense => Intl.message('必要資格', name: 'neededLicense');
  String get checkDocuments =>
      Intl.message('業務に関する書類確認', name: 'checkDocuments');
  String failRegisterIdentification(String value) =>
      Intl.message('本人確認書類の登録に失敗しました。登録できるファイルサイズは${value}Mバイトまでです。',
          name: 'failRegisterIdentification', args: [value]);
  String failRegisterResume(String value) =>
      Intl.message('履歴書登録に失敗しました。登録できるファイルサイズは${value}Mバイトまでです。',
          name: 'failRegisterResume', args: [value]);
  String get pleaseLogin => Intl.message('ログインしてください。', name: 'pleaseLogin');
  String errorUploadMaxCount(String value) =>
      Intl.message('これ以上ファイルをアップロードすることはできません。上限は$valueファイルまでです。 ',
          name: 'errorUploadMaxCount', args: [value]);
  String get pleaseRegisterLicense =>
      Intl.message('所有資格を選択してください。', name: 'pleaseRegisterLicense');
  String get pleaseRegisterIdentification =>
      Intl.message('本人確認書類を選択してください。', name: 'pleaseRegisterIdentification');
  String get pleaseRegisterIdentificationByImory =>
      Intl.message('イモリーでは本人確認書類の登録が必須となっています。所定の本人確認書類を登録してください。',
          name: 'pleaseRegisterIdentificationByImory');
  String get canUseIdentification => Intl.message(
      '本人確認書類で利用できる身分証は以下の通りです。また、身分証明書がイモリーの他のユーザーに公開されることは決してありません。',
      name: 'canUseIdentification');
  String get mustShootOriginal =>
      Intl.message('※撮影の際は、必ず本人確認書類は原本を撮影してください。', name: 'mustShootOriginal');
  String get enableIdentification =>
      Intl.message('※ご利用可能な本人確認書類', name: 'enableIdentification');
  String get driverLicense => Intl.message('運転免許証', name: 'driverLicense');
  String get passport => Intl.message('パスポート', name: 'passport');
  String get myNumberCard => Intl.message('マイナンバーカード', name: 'myNumberCard');
  String get residentBasicCard =>
      Intl.message('住民基本台帳カード', name: 'residentBasicCard');
  String get residentCard => Intl.message('住民票', name: 'residentCard');
  String get updatePhoneNumber =>
      Intl.message('電話番号変更', name: 'updatePhoneNumber');
  String get offerDetail => Intl.message('お仕事詳細', name: 'offerDetail');
  String get recruitmentNumbers =>
      Intl.message('募集人数', name: 'recruitmentNumbers');
  String get description => Intl.message('業務詳細', name: 'description');
  String get jobRequirement => Intl.message('こだわり条件', name: 'jobRequirement');
  String get documents => Intl.message('業務に関する書類', name: 'documents');
  String get submittedDocument =>
      Intl.message('提出が必要な書類', name: 'submittedDocument');
  String get identification => Intl.message('本人確認書類', name: 'identification');
  String get confirmWithOtherApp =>
      Intl.message('ほかのアプリで確認する', name: 'confirmWithOtherApp');
  String get apply => Intl.message('申し込む', name: 'apply');
  String get cashPayment => Intl.message('現金支給', name: 'cashPayment');
  String get transferPayment => Intl.message('振込支給', name: 'transferPayment');
  String get paymentMethod => Intl.message('給与支払い方法', name: 'paymentMethod');
  String get cancelPolicy => Intl.message('キャンセルポリシー', name: 'cancelPolicy');
  String get descriptionOfCancelPolicy =>
      Intl.message('業務確定後に業務をキャンセルした場合、損害賠償が発生する場合があります。',
          name: 'descriptionOfCancelPolicy');
  String get descriptionOfCancelPolicy2 =>
      Intl.message('このボタンを押すと、キャンセルポリシーに同意します。',
          name: 'descriptionOfCancelPolicy2');
  String get confirmationOfOffer =>
      Intl.message('申し込み内容の確認', name: 'confirmationOfOffer');
  String get descriptionOfOfferConfirm =>
      Intl.message('申し込み内容の最終確認をしてください', name: 'descriptionOfOfferConfirm');
  String get determineOffer => Intl.message('申し込みを確定', name: 'determineOffer');
  String get agreeToRuleAfterDetermineOffer =>
      Intl.message('申し込みを確定することで利用規約に同意します。',
          name: 'agreeToRuleAfterDetermineOffer');
  String get employee => Intl.message('被用者', name: 'employee');
  String get employer => Intl.message('雇用者', name: 'employer');
  String get employmentStatus => Intl.message('雇用形態', name: 'employmentStatus');
  String get contractDate => Intl.message('契約日', name: 'contractDate');
  String get descriptionOfContractDate =>
      Intl.message('業務当日に現地でQRコードを読みことで契約締結となります',
          name: 'descriptionOfContractDate');
  String get workDateAndTime => Intl.message('勤務日時', name: 'workDateAndTime');
  String get workPlace => Intl.message('業務地', name: 'workPlace');
  String get reward => Intl.message('業務報酬', name: 'reward');
  String get transportationExpenses =>
      Intl.message('交通費', name: 'transportationExpenses');
  String get workContent => Intl.message('業務内容', name: 'workContent');
  String get late => Intl.message('遅刻', name: 'late');
  String get noteOfOfferConfirm => Intl.message(
      '尚、業務当日に業務先でQRコードを読み込むことで契約締結になります。当日に業務先で解雇事由に該当することが発覚した場合などを含め、契約締結までは業務予定先からキャンセル通知がくる可能性がございます。',
      name: 'noteOfOfferConfirm');
  String get workingConditionsNoticePaper =>
      Intl.message('労働条件通知書.pdf', name: 'workingConditionsNoticePaper');
  String get laborContractPaper =>
      Intl.message('労働誓約書.pdf', name: 'laborContractPaper');
  String get doctorLicense => Intl.message('医師免許', name: 'doctorLicense');
  String get nurseLicense => Intl.message('看護師免許', name: 'nurseLicense');
  String get writingInstrument =>
      Intl.message('筆記用具', name: 'writingInstrument');
  String get shoes => Intl.message('シューズ', name: 'shoes');

  String get requirementItem1 =>
      Intl.message('同意書の内容を確認', name: 'requirementItem1');
  String get requirementItem2 =>
      Intl.message('臨床経験１年以上の方限定', name: 'requirementItem2');
  String get requirementItem3 =>
      Intl.message('現在他院で勤務されていない方限定', name: 'requirementItem3');

  String get frontSide => Intl.message('表面', name: 'frontSide');
  String get backSide => Intl.message('裏面', name: 'backSide');
  String get shootBackSide => Intl.message('裏面も撮影しますか？', name: 'shootBackSide');
  String get offerCaution => Intl.message(
      '業務開始時刻にチェックインできなかった場合、ペナルティやキャンセルとなる可能性があります。余裕を持って現地に到着するようにしましょう。',
      name: 'offerCaution');
  String get confirmResume => Intl.message('履歴書登録確認', name: 'confirmResume');
  String get shootFrontOfResume =>
      Intl.message('履歴書のオモテ面全体を撮影してください。', name: 'shootFrontOfResume');
  String get mustShootResume =>
      Intl.message('※必ず履歴書の原本全体を撮影してください', name: 'mustShootResume');
  String get shootResume => Intl.message('履歴書を撮影する', name: 'shootResume');

  String get registerStripeAccount =>
      Intl.message('Stripeアカウントの登録', name: 'registerStripeAccount');
  String get successRegisterStripeAccountMessage =>
      Intl.message('アカウントの登録が完了しました。',
          name: 'successRegisterStripeAccountMessage');
  String get errorRegisterStripeAccountTitle =>
      Intl.message('Stripeアカウント登録エラー', name: 'errorRegisterStripeAccountTitle');
  String get remarks => Intl.message('注意事項', name: 'remarks');
  String currency(String value) =>
      Intl.message('¥ $value', name: 'currency', args: [value]);
  String get station => Intl.message('最寄り駅', name: 'station');
  String get occupation => Intl.message('職種', name: 'occupation');
  String get medicalDepartment =>
      Intl.message('診療科目', name: 'medicalDepartment');
  String get payment => Intl.message('支払い方法', name: 'payment');
  String get qualification => Intl.message('必要資格', name: 'qualification');
  String get employment => Intl.message('雇用形態', name: 'employment');
  String get available => Intl.message('あり', name: 'available');
  String get notAvailable => Intl.message('なし', name: 'notAvailable');
  String get belonging => Intl.message('持ち物', name: 'belonging');
  String get applicationCondition =>
      Intl.message('応募条件', name: 'applicationCondition');
  String get neededQualification =>
      Intl.message('必要資格', name: 'neededQualification');
  String get passedDeadline => Intl.message('応募締め切り', name: 'passedDeadline');
  String get resume => Intl.message('履歴書', name: 'resume');
  String get qualifications => Intl.message('所有資格', name: 'qualifications');
  String remainingTime(String value) =>
      Intl.message('あと $value日で終了', name: 'remainingTime', args: [value]);
  String get stillRegister =>
      Intl.message('まだ登録されていません。マイページから登録をお願いします。', name: 'stillRegister');
  String get decide => Intl.message('確定', name: 'decide');
  String get photoAndLibrary =>
      Intl.message('撮影・ライブラリ', name: 'photoAndLibrary');
  String get registerDocuments =>
      Intl.message('書類登録', name: 'registerDocuments');
  String get pleaseSelectDocuments =>
      Intl.message('提出が必要な書類を全て選択してください。', name: 'pleaseSelectDocuments');
  String get pleaseSelectQualification =>
      Intl.message('資格を選択してください。', name: 'pleaseSelectQualification');
  String get pleaseSelectImage =>
      Intl.message('画像を選択してください。', name: 'pleaseSelectImage');
  String selectAnything(String value) =>
      Intl.message('$valueを選択', name: 'selectAnything', args: [value]);
  String get selectAlreadyRegisteredIdentification =>
      Intl.message('登録済み本人確認書類。',
          name: 'selectAlreadyRegisteredIdentification');
  String get selectAlreadyRegisteredResume =>
      Intl.message('登録済み履歴書から選択。', name: 'selectAlreadyRegisteredResume');
  String get selectAlreadyRegisteredQualifications =>
      Intl.message('登録済み所有資格から選択。',
          name: 'selectAlreadyRegisteredQualifications');
  String get selectPhotoAndLibrary =>
      Intl.message('撮影又はライブラリから選択。', name: 'selectPhotoAndLibrary');
  String get noResume => Intl.message('まだ履歴書が登録されていません。', name: 'noResume');
  String get noIdentification =>
      Intl.message('まだ本人確認書類が登録されていません。', name: 'noIdentification');
  String get newRegistration => Intl.message('新規登録', name: 'newRegistration');
  String get registerLater => Intl.message('あとで登録する', name: 'registerLater');
  String get applyJobOffer => Intl.message('お仕事の申し込み', name: 'applyJobOffer');
  String get successApplyJobOffer =>
      Intl.message('お仕事の申し込みが完了しました。', name: 'successApplyJobOffer');
  String get errorApplyJobOfferTitle =>
      Intl.message('お仕事の申し込みエラー', name: 'errorApplyJobOfferTitle');
  String get pastWork => Intl.message('過去業務', name: 'pastWork');
  String get completion => Intl.message('完了', name: 'completion');
  String get deadLine => Intl.message('締め切り', name: 'deadLine');
  String get messagePlaceholder =>
      Intl.message('メッセージを入力', name: 'messagePlaceholder');
  String get messagePageText =>
      Intl.message('クリニックの状況により返信できない場合がございますので、予めご了承ください。',
          name: 'messagePageText');
  String get confirmedCase => Intl.message('確定済案件', name: 'confirmedCase');
  String get caseList => Intl.message('案件一覧', name: 'caseList');
  String get message => Intl.message('メッセージ', name: 'message');
  String get fixed => Intl.message('確定済', name: 'fixed');
  String get searchOnTheMap => Intl.message('マップで\n探す', name: 'searchOnTheMap');
  String get selectArea => Intl.message('都道府県を選択', name: 'selectArea');
  String get selectDay => Intl.message('日付選択', name: 'selectDay');
  String get selectEmployment =>
      Intl.message('雇用形態・報酬選択', name: 'selectEmployment');
  String get fullTimeEmployee => Intl.message('正社員', name: 'fullTimeEmployee');
  String get shortTimeEmployee =>
      Intl.message('短期・パート', name: 'shortTimeEmployee');
  String get oneOffWork => Intl.message('単発パート', name: 'OneOffWork');
  String get hourlySalary => Intl.message('時給', name: 'hourlySalary');
  String get dailySalary => Intl.message('日給', name: 'dailySalary');
  String get monthlySalary => Intl.message('月給', name: 'monthlySalary');
  String get refinedSearch => Intl.message('絞り込み検索', name: 'refinedSearch');
  String get clinicalDepartment =>
      Intl.message('診療科目', name: 'clinicalDepartment');
  String get commitmentConditions =>
      Intl.message('こだわり条件', name: 'commitmentConditions');
  String get areaName => Intl.message('地域名', name: 'areaName');
  String get employmentConditions =>
      Intl.message('雇用形態/報酬', name: 'employmentConditions');
  String get date => Intl.message('日付', name: 'date');
  String get dateData => Intl.message('日にち', name: 'dateData');
  String get timeSlot => Intl.message('時間帯', name: 'timeSlot');
  String get time => Intl.message('時間', name: 'time');
  String get onlyJobsBeingRecruited =>
      Intl.message('募集中のお仕事のみ表示', name: 'onlyJobsBeingRecruited');
  String get selectTime => Intl.message('時間帯選択', name: 'selectTime');
  String get scan => Intl.message('スキャン', name: 'scan');
  String get scanPageText =>
      Intl.message('QRコードをスキャンしてチェックインしてください', name: 'scanPageText');
  String get checkInManagement =>
      Intl.message('チェックイン管理', name: 'checkInManagement');
  String get checkInPageText1 =>
      Intl.message('業務を始める前・終えた後には、必ず業務先でQRコードをスキャンして、チェックイン/チェックアウトしてください。',
          name: 'checkInPageText1');
  String get checkInPageText2 => Intl.message(
      'QRコードをスキャンすることで業務時間が決まり、報酬が算出されます。担当者の確認のもと、業務開始より前にチェックイン、業務終了時間より後にチェックアウトしてください。情報の修正は、チェックアウト後の「修正依頼へ」ボタンより行ってください。',
      name: 'checkInPageText2');
  String get checkIn => Intl.message('チェックイン', name: 'checkIn');
  String get revisionRequestStatus =>
      Intl.message('修正依頼状況一覧', name: 'revisionRequestStatus');
  String get feeAdjustmentRequest =>
      Intl.message('報酬額修正依頼はこちらから', name: 'feeAdjustmentRequest');
  String get unbookmarksDialogTitle =>
      Intl.message('ブックマークを解除しますか', name: 'unbookmarksDialogTitle');
}
