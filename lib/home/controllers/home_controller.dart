import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:stok_profit_app/global/controllers/main_controller.dart';

class HomeController extends GetxController {
  TextEditingController sharesTextfield = TextEditingController();
  TextEditingController buyPriceTextfield = TextEditingController();
  TextEditingController sellPriceTextfield = TextEditingController();
  TextEditingController commissionTextfield = TextEditingController();
  var result = 0.0.obs;
  BannerAd bannerAdTop;
  BannerAd bannerAdBottom;

  @override
  void onReady() {
    super.onReady();
    final MainController controller = Get.find();
    final adState = controller.adState;
    adState.initialization.then((status) {
      bannerAdTop = BannerAd(
          size: AdSize.banner,
          adUnitId: adState.bannerAdUnitId,
          request: AdRequest(),
          listener: adState.adListener)
        ..load();

      bannerAdBottom = BannerAd(
          size: AdSize.banner,
          adUnitId: adState.bannerAdUnitId,
          request: AdRequest(),
          listener: adState.adListener)
        ..load();
    });
    update();
  }

  calculate() {
    if (sharesTextfield.text != "" &&
        buyPriceTextfield.text != "" &&
        sellPriceTextfield.text != "" &&
        commissionTextfield.text != "") {
      result.value = ((double.parse(sellPriceTextfield.text) *
                  double.parse(sharesTextfield.text)) -
              (double.parse(buyPriceTextfield.text) *
                  double.parse(sharesTextfield.text))) -
          double.parse(commissionTextfield.text);
    }
  }
}
