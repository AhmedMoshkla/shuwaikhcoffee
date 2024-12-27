import 'package:flutter/material.dart';

bool isArabic() {
  return Directionality.of(navigatorKey.currentContext!) == TextDirection.rtl;
}

// يجب إضافة `navigatorKey` في مشروعك إذا لم يكن موجودًا:
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
