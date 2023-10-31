import 'package:checking_stock/data/models/product_model.dart';
import 'package:checking_stock/data/repositories/product_reposirory/product_repo.dart';
import 'package:checking_stock/utils/colors.dart';
import 'package:checking_stock/utils/fonts.dart';
import 'package:checking_stock/utils/size.dart';
import 'package:flutter/material.dart';

class DropdownProduct extends StatefulWidget {
  final String hintText;
  final TextEditingController dropdown;

  const DropdownProduct({
    Key? key,
    required this.hintText,
    required this.dropdown,
  }) : super(key: key);

  @override
  State<DropdownProduct> createState() => _DropdownProductState();
}

class _DropdownProductState extends State<DropdownProduct> {
  late Data dropdownValue ;

  bool isLoading = true;

  List<Data> product = [];

   action() async {
    await ProductRepo().getProduct('').then((value) {
      setState(() {
        product = value.data;
        dropdownValue = value.data[0];
      });
    });

    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    action();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(widget.hintText, style: body1(cWhite)),
          ),
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Container(
              width: sWidthDynamic(context, 1) - 40,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: cWhite,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 2, color: cPremier),
              ),
              child: isLoading
                  ? Container()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          // width: sWidthDynamic(context, 0.5),
                          child: DropdownButton<Data>(
                            underline: Container(),
                            value:dropdownValue,
                            icon: const Icon(Icons.keyboard_arrow_down_rounded),
                            elevation: 16,
                            style: h3(cPremier),
                            onChanged: (Data? value) {
                              setState(() {
                                dropdownValue = value!;
                                widget.dropdown.text = value.id_barang.toString();
                              });
                            },
                            items: product.map((Data value) {
                              return DropdownMenuItem<Data>(
                                value: value,
                                child: Text(value.name),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
