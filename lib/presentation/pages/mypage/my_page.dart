import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:volare_radiotalk/common/index.dart';
import 'package:volare_radiotalk/model/notifier/index.dart';
import 'package:provider/provider.dart';
import 'package:volare_radiotalk/presentation/pages/profile/profile_page.dart';

import '../app_tab_navigator.dart';

class MyPage extends TabWidgetPage {
  const MyPage({
    Key key,
  }) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();

  @override
  void onBottomNavigationTap() {}
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    final authNotifier = context.watch<AuthNotifier>();
    final user = context.select((UserState state) => state.user);
    final userNotifier = context.watch<UserNotifier>();
    return Scaffold(
      backgroundColor: kAppWhite500,
      appBar: AppBar(
        backgroundColor: kAppWhite500,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 15,
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  user.userImage == null
                      ? const Icon(
                          Icons.person_pin,
                          size: 50,
                        )
                      : SizedBox(
                          height: 50,
                          width: 50,
                          child: CircleAvatar(
                            child: ClipOval(
                              child: Image.network(user.userImage.url),
                            ),
                          ),
                        ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    user.radioName,
                    style: const TextStyle(
                      color: kAppWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              OutlineButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .push<void>(
                    CupertinoPageRoute(
                      builder: (_) => ProfilePage.wrapped(),
                    ),
                  )
                      .then((value) {
                    userNotifier.fetchUser(user.uid);
                  });
                },
                color: kAppWhite,
                highlightedBorderColor: kAppWhite,
                disabledBorderColor: kAppWhite,
                borderSide: const BorderSide(
                  color: kAppWhite,
                ),
                child: Text(
                  context.l10n.edit,
                  style: const TextStyle(
                    color: kAppWhite,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 4,
              bottom: 4,
              left: 60,
              right: 40,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.selfIntroduction,
                  style: const TextStyle(
                    color: kAppWhite,
                  ),
                ),
                // RaisedButton(
                //   color: kAppYellow50,
                //   shape: const StadiumBorder(),
                //   child: Text(
                //     context.l10n.callForQuestions,
                //     style: const TextStyle(
                //       color: kAppBlack50,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                //   onPressed: () {},
                // ),
              ],
            ),
          ),
          ListTile(
            tileColor: kAppWhite500,
            onTap: () {},
            leading: const Icon(
              Icons.play_circle_outline_outlined,
              color: kAppWhite,
            ),
            trailing: const Icon(
              Icons.navigate_next,
              color: kAppWhite,
            ),
            title: Text(
              context.l10n.distributionList,
              style: const TextStyle(
                color: kAppWhite,
              ),
            ),
          ),
          // ListTile(
          //   tileColor: kAppWhite500,
          //   onTap: () {},
          //   leading: const Icon(
          //     Icons.description_outlined,
          //     color: kAppWhite,
          //   ),
          //   trailing: const Icon(
          //     Icons.navigate_next,
          //     color: kAppWhite,
          //   ),
          //   title: Text(
          //     context.l10n.draught,
          //     style: const TextStyle(
          //       color: kAppWhite,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
