import 'package:checking_stock/data/repositories/history_repository/history_repo.dart';
import 'package:checking_stock/utils/colors.dart';
import 'package:checking_stock/utils/route.dart';
import 'package:checking_stock/views/widgets/box_input/dropdown_category.dart';
import 'package:checking_stock/views/widgets/box_input/dropdown_product.dart';
import 'package:checking_stock/views/widgets/box_input/number_input.dart';
import 'package:checking_stock/views/widgets/button/normal_button.dart';
import 'package:checking_stock/views/widgets/header/back_general_haader.dart';
import 'package:flutter/material.dart';

class CreateHistoryPage extends StatefulWidget {
  const CreateHistoryPage({super.key});

  @override
  State<CreateHistoryPage> createState() => _CreateHistoryPageState();
}

class _CreateHistoryPageState extends State<CreateHistoryPage> {
  final jenis = TextEditingController();
  final barang = TextEditingController();
  final jumlah = TextEditingController();

  bool isLoading = false;

  action() {
    setState(() => isLoading = true);
    HistoryRepo()
        .createCategory(
      int.parse(jumlah.text),
      int.parse(barang.text),
      int.parse(barang.text),
    )
        .then((value) {
      goBack(context);
      goBack(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: cPremier,
      body: SafeArea(
        child: Column(
          children: [
            const BackGeneralHeader(title: "Create"),
            const SizedBox(height: 30),
            DropdownCategory(hintText: "Category", dropdown: jenis),
            DropdownProduct(hintText: "Product", dropdown: barang),
            NumberInput(
              controller: jumlah,
              tag: "Jumlah",
              title: "Jumlah",
              isPassword: false,
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () => action(),
              child: NormalButton(title: isLoading ? "Loading" : "Save"),
            )
          ],
        ),
      ),
    );
  }
}
