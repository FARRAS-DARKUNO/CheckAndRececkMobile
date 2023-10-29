import 'package:checking_stock/utils/colors.dart';
import 'package:checking_stock/utils/fonts.dart';
import 'package:checking_stock/utils/route.dart';
import 'package:checking_stock/utils/size.dart';
import 'package:flutter/material.dart';

class LongCard extends StatelessWidget {
  const LongCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => gotoHistory(context),
      child: Container(
        width: sWidthMinus(context, 30),
        height: 150,
        decoration: BoxDecoration(
          color: cb1,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Detail Semua", style: h1(cWhite)),
            const Icon(Icons.history_edu_outlined, color: cWhite, size: 60)
          ],
        ),
      ),
    );
  }
}
