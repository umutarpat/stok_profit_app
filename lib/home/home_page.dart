import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stok_profit_app/global/widgets/textfield.dart';
import 'package:stok_profit_app/home/controllers/home_controller.dart';
import 'package:intl/intl.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency = new NumberFormat.currency(symbol: "");
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      //  appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            textfield(controller.sharesTextfield, "Shares"),
            textfield(controller.buyPriceTextfield, "Buy Price"),
            textfield(controller.sellPriceTextfield, "Sell Price"),
            textfield(controller.commissionTextfield, "Commissions"),
            ElevatedButton(
              onPressed: () => controller.calculate(),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              child: Text(
                "Calculate",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Obx(() => Text("Profit / Loss: " +
                formatCurrency.format(controller.result.value).toString()))
          ],
        ),
      ),
    );
  }
}
