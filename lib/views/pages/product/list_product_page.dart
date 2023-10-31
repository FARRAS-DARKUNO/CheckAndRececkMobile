import 'package:checking_stock/data/models/product_model.dart';
import 'package:checking_stock/data/repositories/product_reposirory/product_repo.dart';
import 'package:checking_stock/utils/colors.dart';
import 'package:checking_stock/utils/fonts.dart';
import 'package:checking_stock/utils/route.dart';
import 'package:checking_stock/utils/size.dart';
import 'package:checking_stock/views/widgets/box_input/search_input.dart';
import 'package:checking_stock/views/widgets/header/back_action_heaeder.dart';
import 'package:flutter/material.dart';

class ListProductPage extends StatefulWidget {
  const ListProductPage({super.key});

  @override
  State<ListProductPage> createState() => _ListProductPageState();
}

class _ListProductPageState extends State<ListProductPage> {
  final search = TextEditingController(text: "");

  List<Data> data = [];

  action() async {
    ProductRepo().getProduct(search.text).then((value) {
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
              title: "Barang",
              action: () => gotoCreateUpdateProduct(context, 0),
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
                    onTap: () => gotoCreateUpdateProduct(context, value.id_barang),
                    child: Container(
                      margin:const  EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.all(20),
                      color: cTersier,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(value.name, style: h3(cWhite)),
                              Text("${value.stock}", style: h3(cWhite))
                            ],
                          ),
                          Text('\nPaling Bnyak  : ${value.max}', style: body1(cWhite)),
                          Text('Paling Dikit : ${value.min}', style: body1(cWhite)),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
