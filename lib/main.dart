import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  if (kIsWeb) {
    runApp(const BalanceWebsite());
  } else {
    runApp(const BalanceWebsite());
  }
}
