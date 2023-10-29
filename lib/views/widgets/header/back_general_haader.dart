import 'package:checking_stock/utils/colors.dart';
import 'package:checking_stock/utils/fonts.dart';
import 'package:checking_stock/utils/route.dart';
import 'package:checking_stock/utils/size.dart';
import 'package:flutter/material.dart';

class BackGeneralHeader extends StatelessWidget {
  final String title;
  const BackGeneralHeader({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: sWidthFull(context),
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: () => goBack(context),
        child: Row(
          children: [
            const Icon(Icons.arrow_back_ios_new_rounded, color: cWhite),
            const SizedBox(width: 10),
            Text(title, style: h1(cWhite))
          ],
        ),
      ),
    );
  }
}
