import 'package:flutter/material.dart';
import 'package:matertino_radio/matertino_radio.dart';

class RadioListGroup extends StatefulWidget {
  const RadioListGroup({Key? key}) : super(key: key);

  @override
  State<RadioListGroup> createState() => _RadioListGroupState();
}

class _RadioListGroupState extends State<RadioListGroup> {

  /// Items List
  static List<String> itemList = [
    "India",
    "Germany",
    "Canada",
    "United States",
  ];

  /// Selected Item
  static String selectedItem = "India";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Radio List Group:"),
        const SizedBox(
          height: 5,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.withOpacity(0.3), width: 1),
              borderRadius: BorderRadius.circular(8)
            ),
            margin: const EdgeInsets.all(0),
            child: Column(
              children: List.generate(
                  itemList.length,
                  (index) => MatertinoRadioListTile(
                      value: itemList[index],
                      groupValue: selectedItem,
                      borderColor: Colors.grey.withOpacity(0.3),
                      borderWidth: 1,
                      onChanged: (val) {
                        setState(() {
                          selectedItem = val!;
                        });
                      },
                      title: itemList[index])),
            ),
          ),
        )
      ],
    );
  }
}
