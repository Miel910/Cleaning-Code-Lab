import 'package:flutter/material.dart';

extension Push on BuildContext {
  push({required Widget screen}) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => screen));
  }
}

extension PushAndRemove on BuildContext {
  pushAndRemove({required Widget screen}) {
    Navigator.pushAndRemoveUntil(this,
        MaterialPageRoute(builder: (context) => screen), (route) => false);
  }
}

extension PushAndRemoveUntil on BuildContext {
  pushAndRemoveUntil({required Widget screen}) {
    Navigator.pushAndRemoveUntil(this,
        MaterialPageRoute(builder: (context) => screen), (route) => false);
  }
}
