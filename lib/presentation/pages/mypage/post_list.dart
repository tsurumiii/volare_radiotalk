import 'package:flutter/material.dart';
import 'package:volare_radiotalk/common/index.dart';
import 'package:provider/provider.dart';
import 'package:volare_radiotalk/model/notifier/index.dart';
import 'package:volare_radiotalk/presentation/pages/app_page_notifier.dart';
import 'package:volare_radiotalk/presentation/pages/play_radio/play_radio_page_notifier.dart';

class PostListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppWhite500,
      appBar: AppBar(
        backgroundColor: kAppWhite500,
        elevation: 0,
        centerTitle: true,
        title: Text(
          context.l10n.distributionList,
          style: const TextStyle(
            color: kAppWhite,
          ),
        ),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    final postList = context.select((UserState state) => state.posts);
    final appPageNotifer = context.watch<AppPageNotifier>();
    final playNotifier = context.watch<PlayRadioPageNotifier>();
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 30),
      itemCount: postList.length,
      itemBuilder: (context, i) {
        final post = postList[i];
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
    );
  }
}
