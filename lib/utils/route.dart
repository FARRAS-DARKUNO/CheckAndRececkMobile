import 'package:checking_stock/views/pages/category/create_update_category_page.dart';
import 'package:checking_stock/views/pages/category/list_category_page.dart';
import 'package:checking_stock/views/pages/history/create_history_page.dart';
import 'package:checking_stock/views/pages/history/list_history_page.dart';
import 'package:checking_stock/views/pages/product/create_update_product_page.dart';
import 'package:checking_stock/views/pages/product/list_product_page.dart';
import 'package:flutter/cupertino.dart';

gotoHistory(BuildContext context) {
  Navigator.of(context).push(CupertinoPageRoute<void>(
    builder: (BuildContext context) => ListHistoryPage(),
  ));
}

gotoProduct(BuildContext context) {
  Navigator.of(context).push(CupertinoPageRoute<void>(
    builder: (BuildContext context) => const ListProductPage(),
  ));
}

gotoCategory(BuildContext context) {
  Navigator.of(context).push(CupertinoPageRoute<void>(
    builder: (BuildContext context) => const ListCategoryPage(),
  ));
}

gotoCreateUpdateProduct(BuildContext context, int id) {
  Navigator.of(context).push(CupertinoPageRoute<void>(
    builder: (BuildContext context) => CreateUpdateProductPage(id: id),
  ));
}

gotoCreateUpdateCategory(BuildContext context, int id) {
  Navigator.of(context).push(CupertinoPageRoute<void>(
    builder: (BuildContext context) => CreateUpdateCategoryPage(id: id),
  ));
}

gotoCreateHostory(BuildContext context) {
  Navigator.of(context).push(CupertinoPageRoute<void>(
    builder: (BuildContext context) => const CreateHistoryPage(),
  ));
}

goBack(BuildContext context) {
  Navigator.pop(context);
}
