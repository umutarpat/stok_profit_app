import 'package:get/get.dart';
import 'package:stok_profit_app/global/Translations/languages/deutsch.dart';
import 'package:stok_profit_app/global/Translations/languages/english.dart';
import 'package:stok_profit_app/global/Translations/languages/turkish.dart';

class HomeTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {'en_US': homeEnglish(), 'de_DE': homeDeutsch(), 'tr_TR': homeTurkish()};
}
