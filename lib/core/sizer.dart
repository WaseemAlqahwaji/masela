

import 'package:fluent_ui/fluent_ui.dart';

extension Space on num {
  SizedBox height() => SizedBox(
    height: toDouble(),
    width: 0,
  );

  SizedBox width() => SizedBox(
    width: toDouble(),
    height: 0,
  );
}
