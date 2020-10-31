import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

enum Flavor { development, staging, production }

class FlavorProvider extends InheritedWidget {
  const FlavorProvider({
    Key key,
    @required this.flavor,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  final Flavor flavor;

  static Flavor of(BuildContext context) =>
      (context.getElementForInheritedWidgetOfExactType<FlavorProvider>().widget
              as FlavorProvider)
          .flavor;

  @override
  bool updateShouldNotify(FlavorProvider oldWidget) => false;
}
