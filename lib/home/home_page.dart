import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:stok_profit_app/global/widgets/textfield.dart';
import 'package:stok_profit_app/home/controllers/home_controller.dart';
import 'package:intl/intl.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency = new NumberFormat.currency(symbol: "");
    final _formKey = GlobalKey<FormState>();
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      //  appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: GetBuilder<HomeController>(
          init: controller,
          builder: (_) {
            return Column(
              children: [
                SingleChildScrollView(
                    child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      if (controller.bannerAdTop == null)
                        SizedBox(height: 50)
                      else
                        Container(
                            height: 60,
                            margin: EdgeInsets.only(top: 30),
                            child: AdWidget(ad: controller.bannerAdTop)),
                      textfield(controller.sharesTextfield, "Shares"),
                      textfield(controller.buyPriceTextfield, "Buy Price"),
                      textfield(controller.sellPriceTextfield, "Sell Price"),
                      textfield(controller.commissionTextfield, "Commissions"),
                      ElevatedButton(
                        onPressed: () {
                          controller.calculate();
                          FocusScope.of(context).requestFocus(new FocusNode());
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        child: Text(
                          "Calculate",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Obx(() => Text("Profit / Loss: " +
                          formatCurrency
                              .format(controller.result.value)
                              .toString())),
                    ],
                  ),
                )),
                Spacer(),
                if (controller.bannerAdBottom != null)
                  Container(
                      height: 60,
                      child: AdWidget(ad: controller.bannerAdBottom)),
              ],
            );
          }),
    );
  }
}
