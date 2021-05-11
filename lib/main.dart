import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:stok_profit_app/global/Translations/home_translation.dart';
import 'package:stok_profit_app/global/controllers/main_controller.dart';
import 'package:stok_profit_app/global/core/ad_state.dart';
import 'package:stok_profit_app/home/home_page.dart';

void main() {
  if (!kDebugMode)
    ErrorWidget.builder = (FlutterErrorDetails details) => Container();

  WidgetsFlutterBinding.ensureInitialized();
  final MainController controller = Get.put(MainController());
  final initFuture = MobileAds.instance.initialize();
  controller.adState = AdState(initFuture);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Market Profit Calculator',
      // debugShowCheckedModeBanner: false,
      translations: HomeTranslation(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
