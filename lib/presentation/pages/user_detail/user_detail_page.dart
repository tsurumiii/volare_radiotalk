import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:volare_radiotalk/common/index.dart';
import 'package:volare_radiotalk/model/firestore_model/user/index.dart';
import 'package:volare_radiotalk/presentation/pages/app_page_notifier.dart';
import 'package:volare_radiotalk/presentation/pages/play_radio/play_radio_page_notifier.dart';
import 'package:volare_radiotalk/presentation/pages/user_detail/user_detail_page_notifier.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage._({Key key}) : super(key: key);

  static Widget wrapped(User user) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<UserDetailPageNotifier, UserDetailPageState>(
          create: (context) => UserDetailPageNotifier(
            context: context,
            user: user,
          ),
        ),
      ],
      child: const UserDetailPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppWhite500,
      appBar: AppBar(
        backgroundColor: kAppWhite500,
        elevation: 0,
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    final user = context.select((UserDetailPageState state) => state.user);

    if (user == null) {
      return const SizedBox();
    }
    return ListView(
      children: [
        Center(
          child: SizedBox(
            height: context.deviceWidth * 0.25,
            width: context.deviceWidth * 0.25,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  user.userImage == null ? noImage : user.userImage.url),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Text(
              user.radioName,
              style: const TextStyle(
                color: kAppWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Text(
              user.selfIntroduction,
              style: const TextStyle(
                color: kAppWhite,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        _postList(context),
        const SizedBox(
          height: 100,
        ),
      ],
    );
  }

  Widget _postList(BuildContext context) {
    final postList =
        context.select((UserDetailPageState state) => state.postList);
    final appPageNotifer = context.watch<AppPageNotifier>();
    final playNotifier = context.watch<PlayRadioPageNotifier>();
    return Column(
      children: postList.map((post) {
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
      }).toList(),
    );
  }
}
