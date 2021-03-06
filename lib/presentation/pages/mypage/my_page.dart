import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:volare_radiotalk/app.dart';
import 'package:volare_radiotalk/common/index.dart';
import 'package:volare_radiotalk/model/notifier/index.dart';
import 'package:provider/provider.dart';
import 'package:volare_radiotalk/presentation/pages/mypage/post_list.dart';
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
    final user = context.select((UserState state) => state.user);
    final userNotifier = context.watch<UserNotifier>();
    final authNotifier = context.watch<AuthNotifier>();
    return Scaffold(
      backgroundColor: kAppWhite500,
      appBar: AppBar(
        backgroundColor: kAppWhite500,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await authNotifier.logOut();
              await Navigator.of(context, rootNavigator: true)
                  .pushReplacement<MaterialPageRoute, void>(
                MaterialPageRoute(
                  builder: (_) => App(),
                ),
              );
            },
          ),
        ],
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
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(user.userImage == null
                          ? noImage
                          : user.userImage.url),
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
            onTap: () async {
              await userNotifier.fetchPost();
              await Navigator.of(context).push<void>(
                CupertinoPageRoute(
                  builder: (_) => const PostListPage(),
                ),
              );
            },
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
