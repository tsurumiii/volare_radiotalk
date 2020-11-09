import 'package:flutter/material.dart';
import 'package:volare_radiotalk/model/notifier/index.dart';
import 'package:provider/provider.dart';

class AppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authNotifier = context.watch<AuthNotifier>();
    return Scaffold(
      appBar: AppBar(
        title: Text('aa'),
      ),
      body: Column(
        children: [
          Center(
            child: InkWell(
              onTap: () {
                authNotifier.logOut();
              },
              child: Text('ログアウト'),
            ),
          ),
        ],
      ),
    );
  }
}
