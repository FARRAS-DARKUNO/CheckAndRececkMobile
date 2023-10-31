import 'package:checking_stock/data/models/history_model.dart';
import 'package:checking_stock/data/repositories/history_repository/history_repo.dart';
import 'package:checking_stock/utils/colors.dart';
import 'package:checking_stock/utils/fonts.dart';
import 'package:checking_stock/utils/route.dart';
import 'package:checking_stock/utils/size.dart';
import 'package:checking_stock/views/widgets/box_input/dropdown_input.dart';
import 'package:checking_stock/views/widgets/box_input/search_input.dart';
import 'package:checking_stock/views/widgets/header/back_action_heaeder.dart';
import 'package:flutter/material.dart';

class ListHistoryPage extends StatefulWidget {
  const ListHistoryPage({super.key});

  @override
  State<ListHistoryPage> createState() => _ListHistoryPageState();
}

class _ListHistoryPageState extends State<ListHistoryPage> {
  final search = TextEditingController();

  final dropdown = TextEditingController(text: "waktu-lama");

  List<Data> data = [];

  action() {
    HistoryRepo().getHistory(search.text, dropdown.text).then((value) {
      setState(() {
        data = value.data;
      });
    });
  }

  delete(int id) {
    HistoryRepo().deleteHistory(id).then((_) {
      goBack(context);
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
              title: "History",
              action: () => gotoCreateHostory(context),
            ),
            SearchInput(text: search, action: action),
            DropdownInput(
              hintText: "Filter",
              dropdown: dropdown,
              action: () => action(),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: sWidthFull(context),
              height: sHeightMinus(context, 262),
              child: ListView(
                children: data.map((value) {
                  return Container(
                    padding: const EdgeInsets.all(20),
                    color: cTersier,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(value.name, style: h3(cWhite)),
                            GestureDetector(
                              onTap: () => delete(value.id_jual),
                              child: const Icon(Icons.remove_circle_sharp,
                                  color: cWhite),
                            )
                          ],
                        ),
                        Text('\nJumlah  : ${value.jumlah}',
                            style: body1(cWhite)),
                        Text(value.date, style: body2(cWhite)),
                      ],
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
