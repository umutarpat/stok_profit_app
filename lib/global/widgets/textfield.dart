import 'package:flutter/material.dart';
import 'package:get/get.dart';

textfield(TextEditingController textEditingController, String labeltext) {
  return Container(
    padding: const EdgeInsets.all(18.0),
    margin: const EdgeInsets.only(top: 10.0, bottom: 10),
    child: TextField(
      controller: textEditingController,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: labeltext,
        alignLabelWithHint: true,
      ),
    ),
  );
}
