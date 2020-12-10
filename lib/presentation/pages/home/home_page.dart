import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:volare_radiotalk/common/index.dart';
import 'package:volare_radiotalk/model/notifier/post/post_notifier.dart';
import 'package:volare_radiotalk/model/notifier/post/post_state.dart';
import 'package:provider/provider.dart';
import 'package:volare_radiotalk/model/notifier/users/users_state.dart';
import 'package:volare_radiotalk/presentation/pages/app_page_notifier.dart';
import 'package:volare_radiotalk/presentation/pages/play_radio/play_radio_page_notifier.dart';
import 'package:volare_radiotalk/presentation/pages/talk_list/talk_list_page.dart';

import '../app_tab_navigator.dart';

class HomePage extends TabWidgetPage {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

  @override
  void onBottomNavigationTap() {}
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppWhite500,
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    final postNotifier = context.watch<PostNotifier>();
    return SafeArea(
      child: ListView(
        children: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ライブ配信',
                    style: const TextStyle(
                      color: kAppWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Icon(
                    Icons.navigate_next,
                    color: kAppWhite,
                    size: 35,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: context.deviceWidth * 0.5,
            width: context.deviceWidth,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, i) {
                return SizedBox(
                  width: context.deviceWidth * 0.5,
                  height: context.deviceWidth * 0.5,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: context.deviceWidth * 0.5,
                          height: context.deviceWidth * 0.5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              noImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () {
              postNotifier.fetchPosts();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '注目の配信者',
                    style: const TextStyle(
                      color: kAppWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Icon(
                    Icons.navigate_next,
                    color: kAppWhite,
                    size: 35,
                  ),
                ],
              ),
            ),
          ),
          _userList(context),
          const SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute<void>(
                  builder: (_) => TalkListPage(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'おすすめトーク',
                    style: const TextStyle(
                      color: kAppWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Icon(
                    Icons.navigate_next,
                    color: kAppWhite,
                    size: 35,
                  ),
                ],
              ),
            ),
          ),
          _postList(context),
        ],
      ),
    );
  }

  Widget _userList(BuildContext context) {
    final userList = context.select((UsersState state) => state.userList);
    return SizedBox(
      height: context.deviceWidth * 0.4,
      width: context.deviceWidth,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: userList.length,
        itemBuilder: (context, i) {
          final user = userList[i];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Column(
              children: [
                SizedBox(
                  height: context.deviceWidth * 0.25,
                  width: context.deviceWidth * 0.25,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      user.userImage == null ? noImage : user.userImage.url,
                    ),
                  ),
                ),
                SizedBox(
                  width: context.deviceWidth * 0.25,
                  child: Text(
                    user.radioName,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _postList(BuildContext context) {
    final postList = context.select((PostState state) => state.postList);
    final appPageNotifer = context.watch<AppPageNotifier>();
    final playNotifier = context.watch<PlayRadioPageNotifier>();
    return SizedBox(
      height: (context.deviceWidth * 0.3) * 5,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: postList.isEmpty
            ? 0
            : postList.length <= 4
                ? postList.length
                : 4,
        itemBuilder: (context, index) {
          final post = postList[index];
          return InkWell(
            onTap: () {
              playNotifier
                ..setUrl(post.post.url)
                ..setPost(post);
              appPageNotifer.panelController.open();
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  SizedBox(
                    width: context.deviceWidth * 0.2,
                    height: context.deviceWidth * 0.2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        post.postImage == null ? noImage : post.postImage.url,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: context.deviceWidth * 0.28,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: context.deviceWidth * 0.09),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post.title ?? '',
                                style: const TextStyle(
                                  color: kAppWhite,
                                ),
                              ),
                              SizedBox(
                                height: context.deviceWidth * 0.05,
                              ),
                              Text(
                                post.radioName ?? 'トクメイさん',
                                style: const TextStyle(
                                  color: kAppWhite,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: context.deviceWidth * 0.6,
                          child: const Divider(
                            height: 1,
                            color: kAppWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
