import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:volare_radiotalk/common/index.dart';
import 'package:volare_radiotalk/presentation/pages/auth/auth_page_notifier.dart';

class AuthPage extends StatelessWidget {
  const AuthPage._({Key key}) : super(key: key);

  static Widget wrapped() {
    return MultiProvider(
      providers: [
        StateNotifierProvider<AuthPageNotifier, AuthPageState>(
          create: (context) => AuthPageNotifier(context: context),
        ),
      ],
      child: const AuthPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final notifer = context.watch<AuthPageNotifier>();
    final isLoginPage = context.select((AuthPageState state) => state.isLogin);
    return Scaffold(
      backgroundColor: kAppBlack200,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kAppBlack50,
        title: Text(context.l10n.account),
      ),
      body: GestureDetector(
        onTap: () {
          notifer.emailFocusNode.unfocus();
          notifer.passFocusNode.unfocus();
        },
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text(
                  isLoginPage ? context.l10n.login : context.l10n.signIn,
                  style: const TextStyle(
                    color: kAppWhite,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                focusNode: notifer.emailFocusNode,
                onChanged: notifer.onChangeEmail,
                style: const TextStyle(
                  color: kAppWhite,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: kAppWhite)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: kAppWhite)),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kAppWhite.withOpacity(0.8)),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kAppWhite.withOpacity(0.8)),
                  ),
                  labelText: context.l10n.emailAddress,
                  labelStyle: TextStyle(color: kAppWhite.withOpacity(0.5)),
                  hintStyle: TextStyle(color: kAppWhite.withOpacity(0.8)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                focusNode: notifer.passFocusNode,
                onChanged: notifer.onChangePassword,
                style: const TextStyle(
                  color: kAppWhite,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: kAppWhite)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: kAppWhite)),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kAppWhite.withOpacity(0.8)),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kAppWhite.withOpacity(0.8)),
                  ),
                  labelText: context.l10n.password,
                  labelStyle: TextStyle(color: kAppWhite.withOpacity(0.5)),
                  hintStyle: TextStyle(color: kAppWhite.withOpacity(0.8)),
                ),
              ),
            ),
            Center(
              child: RaisedButton(
                color: kAppYellow50,
                shape: const StadiumBorder(),
                child: Text(
                  isLoginPage ? context.l10n.login : context.l10n.signIn,
                  style: const TextStyle(
                    color: kAppBlack50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: notifer.sendFunction,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: InkWell(
                  onTap: notifer.onChangeIsLoginPage,
                  child: Text(
                    isLoginPage
                        ? context.l10n.signInText
                        : context.l10n.loginText,
                    style: const TextStyle(
                      color: kAppWhite,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
