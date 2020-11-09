import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:volare_radiotalk/model/notifier/auth/auth_state.dart';
import 'package:volare_radiotalk/model/repository/auth_repository.dart';
import 'package:volare_radiotalk/model/repository/index.dart';

import 'model/notifier/auth/auth_notifier.dart';

List<SingleChildWidget> get providers {
  return <SingleChildWidget>[
    Provider(create: (context) => GlobalKey<NavigatorState>()),
    ..._repositoryProviders,
    ..._notifierProviders
  ];
}

/// DI repository
List<SingleChildWidget> get _repositoryProviders {
  return <SingleChildWidget>[
    Provider<AuthRepository>(
      create: (_) => AuthDataSource(),
    )
  ];
}

/// DI state notifier
/// Singletonのように扱いたい場合はここに追加する
List<SingleChildWidget> get _notifierProviders {
  return <SingleChildWidget>[
    StateNotifierProvider<AuthNotifier, AuthState>(
      create: (_) => AuthNotifier(),
    ),
  ];
}
