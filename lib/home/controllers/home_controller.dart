import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController sharesTextfield = TextEditingController();
  TextEditingController buyPriceTextfield = TextEditingController();
  TextEditingController sellPriceTextfield = TextEditingController();
  TextEditingController commissionTextfield = TextEditingController();
  var result = 0.0.obs;
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
