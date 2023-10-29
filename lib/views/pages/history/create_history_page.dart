import 'package:checking_stock/utils/colors.dart';
import 'package:checking_stock/views/widgets/box_input/dropdown_input.dart';
import 'package:checking_stock/views/widgets/box_input/number_input.dart';
import 'package:checking_stock/views/widgets/box_input/text_input.dart';
import 'package:checking_stock/views/widgets/button/normal_button.dart';
import 'package:checking_stock/views/widgets/header/back_general_haader.dart';
import 'package:flutter/material.dart';

class CreateHistoryPage extends StatefulWidget {
  const CreateHistoryPage({super.key});

  @override
  State<CreateHistoryPage> createState() => _CreateHistoryPageState();
}

class _CreateHistoryPageState extends State<CreateHistoryPage> {
  final name = TextEditingController();
  final jenis = TextEditingController();
  final jumlah = TextEditingController();

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
            DropdownInput(hintText: "Name", dropdown: name),
            
            DropdownInput(hintText: "Jenis", dropdown: jenis),
            NumberInput(
              controller: jumlah,
              tag: "Jumlah",
              title: "Jumlah",
              isPassword: false,
            ),
            const SizedBox(height: 30),
            const NormalButton(title: "Save")
          ],
        ),
      ),
    );
  }
}
