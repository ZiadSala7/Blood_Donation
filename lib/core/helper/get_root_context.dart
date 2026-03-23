import 'package:flutter/widgets.dart';

BuildContext getRootContext(BuildContext context) {
  return Navigator.of(context, rootNavigator: true).context;
}
