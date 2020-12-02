import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:volare_radiotalk/common/index.dart';
import 'package:volare_radiotalk/presentation/pages/post/post_page_notifier.dart';
import 'package:volare_radiotalk/presentation/widget/index.dart';

class PostPage extends StatelessWidget {
  const PostPage._({Key key}) : super(key: key);

  static Widget wrapped(String filePath) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<PostPageNotifier, PostPageState>(
          create: (context) => PostPageNotifier(
            context: context,
            filePath: filePath,
          ),
        ),
      ],
      child: const PostPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppBlack50,
      appBar: AppBar(
        backgroundColor: kAppBlack50,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          context.hideKeyboard();
        },
        child: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    final notifier = context.watch<PostPageNotifier>();
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'トークタイトル',
                    style: TextStyle(
                      color: kAppWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    child: ColoredBox(
                      color: kAppRed400,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 4),
                        child: Text(
                          '必須',
                          style: const TextStyle(
                            color: kAppWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Theme(
                data:
                    Theme.of(context).copyWith(splashColor: Colors.transparent),
                child: TextField(
                  onChanged: notifier.onChangeTitle,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: kAppWhite,
                  ),
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                    fillColor: kAppGray50,
                    filled: true,
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                        color: kAppGray50,
                      ),
                    ),
                    hintText: '例)家での過ごし方',
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: kAppWhite300,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                        color: kAppGray50,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                '*トークタイトルは必須です',
                style: const TextStyle(
                  color: kAppOrange200,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'トーク詳細',
                style: TextStyle(
                  color: kAppWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Theme(
                data:
                    Theme.of(context).copyWith(splashColor: Colors.transparent),
                child: TextField(
                  onChanged: notifier.onChangeDetail,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: kAppWhite,
                  ),
                  minLines: 10,
                  maxLines: 10,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                    fillColor: kAppGray50,
                    filled: true,
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                        color: kAppGray50,
                      ),
                    ),
                    hintText: '',
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: kAppWhite300,
                    ),
                    focusedBorder: const OutlineInputBorder(
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
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Button(
            text: '配信する',
            textColor: kAppBlack50,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            isRoundedCorner: true,
            onTap: () {
              notifier.sendPost();
            },
            isEnable: true,
            color: kAppYellow100,
          ),
        )
      ],
    );
  }
}
