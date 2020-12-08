import 'package:flutter/material.dart';
import 'package:volare_radiotalk/common/index.dart';
import 'package:volare_radiotalk/model/notifier/post/post_state.dart';
import 'package:provider/provider.dart';
import 'package:volare_radiotalk/presentation/pages/app_page_notifier.dart';
import 'package:volare_radiotalk/presentation/pages/play_radio/play_radio_page_notifier.dart';

class TalkListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppWhite500,
      appBar: AppBar(
        backgroundColor: kAppWhite500,
        elevation: 0,
        title: const Text(
          'おすすめトーク',
          style: TextStyle(
            color: kAppWhite,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    final postList = context.select((PostState state) => state.postList);
    final appPageNotifer = context.watch<AppPageNotifier>();
    final playNotifier = context.watch<PlayRadioPageNotifier>();
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 30),
      itemCount: postList.length,
      itemBuilder: (context, i) {
        final post = postList[i];
        return InkWell(
          onTap: () {
            playNotifier.setUrl(post.post.url);
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
                      post.postImage == null
                          ? 'https://img.sauna-ikitai.com/sauna/2779_20180530_072258_WeX9DUld9M_large.jpg'
                          : post.postImage.url,
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
