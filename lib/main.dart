import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/routing/app_router.dart';
import 'package:shuwaikh/shuwaikh_app.dart';

import 'core/di/dependency_injection.dart';
import 'core/helpers/constants.dart';
import 'core/helpers/shared_pref_helper.dart';

void main() async {
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  await checkIfLoggedInUser();
  runApp(
    ShuwaikhApp(
      appRouter: AppRouter(),
    ),
  );

  ///
  ///
  /// take your money my friend before work, he will
  ///
  ///
}

checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (userToken.isNullOrEmpty()) {
    isLoggedInUser = false;
  } else {
    isLoggedInUser = true;
  }
}