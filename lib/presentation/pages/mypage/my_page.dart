import 'package:flutter/material.dart';
import 'package:volare_radiotalk/common/index.dart';

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
    return Scaffold(
      backgroundColor: kAppWhite500,
      appBar: AppBar(
        backgroundColor: kAppWhite500,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings_outlined,
              size: 30,
            ),
            onPressed: () {},
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
                  const Icon(
                    Icons.person_pin,
                    size: 50,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'DJトクメイ',
                    style: const TextStyle(
                      color: kAppWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              OutlineButton(
                onPressed: () {},
                color: kAppWhite,
                highlightedBorderColor: kAppWhite,
                disabledBorderColor: kAppWhite,
                borderSide: const BorderSide(
                  color: kAppWhite,
                ),
                child: const Text(
                  '変更',
                  style: TextStyle(
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
                  'ああああああああああああああああああああああああああああああああああ',
                  style: const TextStyle(
                    color: kAppWhite,
                  ),
                ),
                RaisedButton(
                  color: kAppYellow50,
                  shape: const StadiumBorder(),
                  child: Text(
                    '質問を募集する',
                    style: const TextStyle(
                      color: kAppBlack50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {},
                ),
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
              '配信一覧',
              style: const TextStyle(
                color: kAppWhite,
              ),
            ),
          ),
          ListTile(
            tileColor: kAppWhite500,
            onTap: () {},
            leading: const Icon(
              Icons.description_outlined,
              color: kAppWhite,
            ),
            trailing: const Icon(
              Icons.navigate_next,
              color: kAppWhite,
            ),
            title: Text(
              '下書き',
              style: const TextStyle(
                color: kAppWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
