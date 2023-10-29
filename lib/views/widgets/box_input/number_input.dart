import 'package:checking_stock/utils/colors.dart';
import 'package:checking_stock/utils/fonts.dart';
import 'package:checking_stock/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInput extends StatelessWidget {
  final TextEditingController controller;
  final String tag;
  final String title;
  final bool isPassword;
  const NumberInput({
    required this.controller,
    required this.tag,
    required this.title,
    required this.isPassword,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: sWidthDynamic(context, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(title, style: body1(cWhite)),
          ),
          Container(
            width: sWidthDynamic(context, 0.9),
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: cWhite,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 2, color: cPremier),
            ),
            child: TextField(
              maxLength: 14,
              controller: controller,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              obscureText: isPassword,
              enableSuggestions: !isPassword,
              autocorrect: false,
              decoration: InputDecoration(
                counterText: '',
                border: InputBorder.none,
                hintText: tag,
              ),
            ),
          )
        ],
      ),
    );
  }
}
