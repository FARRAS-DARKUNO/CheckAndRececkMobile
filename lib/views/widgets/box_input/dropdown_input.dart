import 'package:checking_stock/utils/colors.dart';
import 'package:checking_stock/utils/fonts.dart';
import 'package:checking_stock/utils/size.dart';
import 'package:flutter/material.dart';

class DropdownInput extends StatefulWidget {
  final String hintText;
  final TextEditingController dropdown;
  final VoidCallback action;

  const DropdownInput({
    Key? key,
    required this.hintText,
    required this.dropdown,
    required this.action,
  }) : super(key: key);

  @override
  State<DropdownInput> createState() => _DropdownInputState();
}

class _DropdownInputState extends State<DropdownInput> {
  String dropdownValue = "waktu-lama";

  List<String> category = ["waktu-lama", "waktu-baru", "nama-asc", "nama-desc"];

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
          Container(
            width: sWidthDynamic(context, 1) - 40,
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: cWhite,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 2, color: cPremier),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Container(
                  alignment: Alignment.centerRight,
                  // width: sWidthDynamic(context, 0.5),
                  child: DropdownButton<String>(
                    underline: Container(),
                    value: dropdownValue,
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    elevation: 16,
                    style: h3(cPremier),
                    onChanged: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                        widget.dropdown.text = value;
                      });
                      widget.action();
                    },
                    items:
                        category.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                          alignment: Alignment.centerRight,
                          // width: sWidthDynamic(context, 0.),
                          child: Text(value),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
