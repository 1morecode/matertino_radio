import 'package:custom_radio_checkbox/custom_radio_checkbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalBottomSheetRadioGroup extends StatefulWidget {
  const ModalBottomSheetRadioGroup({Key? key}) : super(key: key);

  @override
  State<ModalBottomSheetRadioGroup> createState() =>
      _ModalBottomSheetRadioGroupState();
}

class _ModalBottomSheetRadioGroupState
    extends State<ModalBottomSheetRadioGroup> {
  List<String> items = ["Item 1", "Item 2"];
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return BottomSheetRadio(
        list: items,
        onSelect: (val) {
          setState(() {
            selectedItem = val;
          });
        },
        selected: selectedItem,
        child: CupertinoTextField(
          onTap: null,
          controller: TextEditingController(text: selectedItem),
          placeholder: "Select Item",
          enabled: false,
          suffix: const Icon(Icons.arrow_drop_down),
        ));
  }
}
