import 'package:checking_stock/utils/colors.dart';
import 'package:checking_stock/views/widgets/box_input/text_input.dart';
import 'package:checking_stock/views/widgets/button/normal_button.dart';
import 'package:checking_stock/views/widgets/header/back_general_haader.dart';
import 'package:flutter/material.dart';

class CreateUpdateCategoryPage extends StatefulWidget {
  final int id;
  const CreateUpdateCategoryPage({required this.id, super.key});

  @override
  State<CreateUpdateCategoryPage> createState() =>
      _CreateUpdateCategoryPageState();
}

class _CreateUpdateCategoryPageState extends State<CreateUpdateCategoryPage> {
  final name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: cPremier,
      body: SafeArea(
        child: Column(
          children: [
            BackGeneralHeader(title: widget.id == 0 ? "Create" : "Update"),
            const SizedBox(height: 30),
            TextInput(
              controller: name,
              tag: "Name Product",
              title: "Name",
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
