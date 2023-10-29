import 'package:checking_stock/utils/colors.dart';
import 'package:checking_stock/utils/fonts.dart';
import 'package:checking_stock/utils/size.dart';
import 'package:checking_stock/views/widgets/card/card_to_page.dart';
import 'package:checking_stock/views/widgets/card/long_card.dart';
import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPremier,
      body: SafeArea(
        child: Container(
          width: sWidthFull(context),
          height: sHeightFull(context),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [cPremier, cSekunder],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welocme", style: h1(cWhite)),
              const SizedBox(height: 40),
              const LongCard(),
              const CardToPage()
            ],
          ),
        ),
      ),
    );
  }
}
