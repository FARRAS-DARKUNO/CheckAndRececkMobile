import 'package:checking_stock/utils/colors.dart';
import 'package:checking_stock/utils/fonts.dart';
import 'package:checking_stock/utils/route.dart';
import 'package:checking_stock/utils/size.dart';
import 'package:checking_stock/views/widgets/box_input/dropdown_input.dart';
import 'package:checking_stock/views/widgets/box_input/search_input.dart';
import 'package:checking_stock/views/widgets/header/back_action_heaeder.dart';
import 'package:flutter/material.dart';

class ListHistoryPage extends StatelessWidget {
  ListHistoryPage({super.key});

  final search = TextEditingController();
  final dropdown = TextEditingController();

  action() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: cPremier,
      body: SafeArea(
        child: Column(
          children: [
            BackActionHeader(
              title: "History",
              action: () => gotoCreateHostory(context),
            ),
            SearchInput(text: search, action: action),
            DropdownInput(
                hintText: "Filter", dropdown: dropdown),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: sWidthFull(context),
              height: sHeightMinus(context, 262),
              child: ListView(children: [
                // children: data.map((value) {
                Container(
                  padding: const EdgeInsets.all(20),
                  color: cTersier,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Nama Barang", style: h3(cWhite)),
                          const Icon(Icons.remove_circle_sharp, color: cWhite)
                        ],
                      ),
                      Text('\nJumlah  : 80', style: body1(cWhite)),
                      Text('20 Juli 2001', style: body2(cWhite)),
                    ],
                  ),
                )
              ]
                  // }).toList(),
                  ),
            )
          ],
        ),
      ),
    );
  }
}
