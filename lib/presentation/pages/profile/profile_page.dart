import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:volare_radiotalk/common/helper/pick_image_helper.dart';
import 'package:volare_radiotalk/common/index.dart';
import 'package:volare_radiotalk/model/notifier/index.dart';
import 'package:volare_radiotalk/presentation/pages/profile/profile_page_notifier.dart';
import 'package:volare_radiotalk/presentation/widget/index.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage._({Key key}) : super(key: key);

  static Widget wrapped() {
    return MultiProvider(
      providers: [
        StateNotifierProvider<ProfilePageNotifier, ProfilePageState>(
          create: (context) => ProfilePageNotifier(
            context: context,
          ),
        ),
      ],
      child: const ProfilePage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppWhite500,
      appBar: AppBar(
        backgroundColor: kAppWhite500,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          context.l10n.profileEdit,
          style: const TextStyle(
            color: kAppWhite,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          context.hideKeyboard();
        },
        child: ListView(
          children: [
            _userImage(context),
            _radioName(context),
            _selfIntroduction(context),
            _send(context),
          ],
        ),
      ),
    );
  }

  Widget _userImage(BuildContext context) {
    final notifier = context.watch<ProfilePageNotifier>();
    final image = context.select((ProfilePageState state) => state.image);
    final isImageUrl =
        context.select((ProfilePageState state) => state.isImageUrl);
    final imageUrl = context.select((UserState state) => state.user.userImage);
    return Center(
      child: InkWell(
        onTap: () async {
          final croppedFile = await pickCropAvatarImage();
          print(croppedFile);
          notifier.setImageFile(croppedFile);
        },
        child: isImageUrl
            ? SizedBox(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  child: ClipOval(
                    child: image != null
                        ? Image.file(image)
                        : Image.network(imageUrl.url),
                  ),
                ),
              )
            : Stack(
                children: [
                  const Icon(
                    Icons.person_pin,
                    size: 100,
                  ),
                  const Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: kAppYellow100,
                      child: Icon(
                        Icons.edit,
                        color: kAppBlack,
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }

  Widget _radioName(BuildContext context) {
    final notifier = context.watch<ProfilePageNotifier>();
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'ラジオネーム',
            style: TextStyle(
              color: kAppWhite,
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(splashColor: Colors.transparent),
            child: TextField(
              controller: notifier.radioNameController,
              onChanged: notifier.setRadioName,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: kAppWhite,
              ),
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                fillColor: kAppGray50,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: kAppGray50,
                  ),
                ),
                hintText: 'トクメイ',
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: kAppWhite300,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: kAppGray50,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _selfIntroduction(BuildContext context) {
    final notifier = context.watch<ProfilePageNotifier>();
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '自己紹介',
            style: TextStyle(
              color: kAppWhite,
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(splashColor: Colors.transparent),
            child: TextField(
              controller: notifier.selfIntoroController,
              onChanged: notifier.setSelfIntro,
              minLines: 5,
              maxLines: 5,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: kAppWhite,
              ),
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                fillColor: kAppGray50,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: kAppGray50,
                  ),
                ),
                hintText: '',
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: kAppWhite300,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: kAppGray50,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _send(BuildContext context) {
    final notifier = context.watch<ProfilePageNotifier>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Button(
        text: '保存する',
        textColor: kAppBlack50,
        fontWeight: FontWeight.bold,
        fontSize: 16,
        isRoundedCorner: true,
        onTap: () {
          notifier.editProfile();
        },
        isEnable: true,
        color: kAppYellow100,
      ),
    );
  }
}
