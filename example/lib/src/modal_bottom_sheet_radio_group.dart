import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matertino_radio/matertino_radio.dart';

class ModalBottomSheetRadioGroup extends StatefulWidget {
  const ModalBottomSheetRadioGroup({Key? key}) : super(key: key);

  @override
  State<ModalBottomSheetRadioGroup> createState() =>
      _ModalBottomSheetRadioGroupState();
}

class _ModalBottomSheetRadioGroupState
    extends State<ModalBottomSheetRadioGroup> {
  List<String> items = ["Adventure",
    "Agility",
    "Cultural Influence",
    "Entrepreneurship",
    "Heritage",
    "Movers",
    "Open for Business",
    "Power",
    "Quality of Life",
    "Social Purpose"];

  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Modal Bottom Sheet Radio Group:"),
        const SizedBox(height: 5,),
        MatertinoBottomSheetRadio(
          list: items,
          onSelect: (val) {
            setState(() {
              selectedItem = val;
            });
          },
          selected: selectedItem,
          isSearchEnable: true,
          selectOnRadioTap: false,
          heading: "Select Item",
          height: 0.7,
          child: SizedBox(
            height: 45,
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.withOpacity(0.3), width: 1),
                  borderRadius: BorderRadius.circular(8)
              ),
              margin: const EdgeInsets.all(0),
              child: CupertinoTextField(
                onTap: null,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white
                ),
                controller: TextEditingController(text: selectedItem),
                placeholder: "Select Item",
                enabled: false,
                suffix: const Icon(Icons.arrow_drop_down),
              ),
            ),
          ),
        )
      ],
    );
  }
}
