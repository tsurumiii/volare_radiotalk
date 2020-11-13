import 'package:flutter/material.dart';
import 'package:volare_radiotalk/common/index.dart';

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
      body: SafeArea(
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
                                'https://img.sauna-ikitai.com/sauna/2779_20180530_072258_WeX9DUld9M_large.jpg',
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
              onTap: () {},
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
            SizedBox(
              height: context.deviceWidth * 0.4,
              width: context.deviceWidth,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, i) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Column(
                      children: [
                        SizedBox(
                          height: context.deviceWidth * 0.25,
                          width: context.deviceWidth * 0.25,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://img.sauna-ikitai.com/sauna/2779_20180530_072258_WeX9DUld9M_large.jpg'),
                          ),
                        ),
                        SizedBox(
                          width: context.deviceWidth * 0.25,
                          child: Text(
                            'DJトクメイ',
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
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {},
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
            SizedBox(
              height: (context.deviceWidth * 0.2) * 5,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        SizedBox(
                          width: context.deviceWidth * 0.2,
                          height: context.deviceWidth * 0.2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              'https://img.sauna-ikitai.com/sauna/2779_20180530_072258_WeX9DUld9M_large.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
