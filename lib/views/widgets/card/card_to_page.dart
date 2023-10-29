import 'package:checking_stock/utils/colors.dart';
import 'package:checking_stock/utils/fonts.dart';
import 'package:checking_stock/utils/route.dart';
import 'package:checking_stock/utils/size.dart';
import 'package:flutter/material.dart';

class CardToPage extends StatelessWidget {
  const CardToPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => gotoProduct(context),
            child: Container(
              width: sWidthDynamic(context, 0.42),
              height: 200,
              decoration: BoxDecoration(
                color: cb2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Barang", style: h1(cWhite)),
                  const Icon(
                    Icons.anchor_sharp,
                    color: cWhite,
                    size: 60,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => gotoCategory(context),
            child: Container(
              width: sWidthDynamic(context, 0.42),
              height: 200,
              decoration: BoxDecoration(
                color: cb3,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Jenis", style: h1(cWhite)),
                  const Icon(
                    Icons.category,
                    color: cWhite,
                    size: 60,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
