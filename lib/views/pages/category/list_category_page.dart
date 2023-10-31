import 'package:checking_stock/data/models/category_model.dart';
import 'package:checking_stock/data/repositories/category_repository/category_repo.dart';
import 'package:checking_stock/utils/colors.dart';
import 'package:checking_stock/utils/fonts.dart';
import 'package:checking_stock/utils/route.dart';
import 'package:checking_stock/utils/size.dart';
import 'package:checking_stock/views/widgets/box_input/search_input.dart';
import 'package:checking_stock/views/widgets/header/back_action_heaeder.dart';
import 'package:flutter/material.dart';

class ListCategoryPage extends StatefulWidget {
  const ListCategoryPage({super.key});

  @override
  State<ListCategoryPage> createState() => _ListCategoryPageState();
}

class _ListCategoryPageState extends State<ListCategoryPage> {
  final search = TextEditingController(text: "");

  List<Data> data = [];

  action() async {
    CategoryRepo().getCategory(search.text).then((value) {
      setState(() {
        data = value.data;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    action();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: cPremier,
      body: SafeArea(
        child: Column(
          children: [
            BackActionHeader(
              title: "Jenis",
              action: () => gotoCreateUpdateCategory(context, 0),
            ),
            SearchInput(text: search, action: action),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: sWidthFull(context),
              height: sHeightMinus(context, 173),
              child: ListView(
                children: data.map((value) {
                  return GestureDetector(
                      onTap: () => gotoCreateUpdateCategory(
                            context,
                            value.id_jenis,
                          ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.all(20),
                        color: cTersier,
                        child: Text(value.name, style: h2(cWhite)),
                      ));
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
