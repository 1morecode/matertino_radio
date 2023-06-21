import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matertino_radio/matertino_radio.dart';

class CustomRadioListGroup extends StatefulWidget {
  const CustomRadioListGroup({Key? key}) : super(key: key);

  @override
  State<CustomRadioListGroup> createState() => _CustomRadioListGroupState();
}

class _CustomRadioListGroupState extends State<CustomRadioListGroup> {
  /// Items List
  static List<Map<String, dynamic>> itemList = [
    {
      "title": "India",
      "rank": "#1",
      "color": Colors.cyan.withOpacity(0.3)
    },
    {
      "title": "Germany",
      "rank": "#2",
      "color": Colors.green.withOpacity(0.3)
    },
    {
      "title": "Canada",
      "rank": "#3",
      "color": Colors.blue.withOpacity(0.3)
    },
    {
      "title": "United States",
      "rank": "#4",
      "color": Colors.redAccent.withOpacity(0.3)
    },
    {
      "title": "Switzerland",
      "rank": "#5",
      "color": Colors.amber.withOpacity(0.3)
    },
    {
      "title": "China",
      "rank": "#6",
      "color": Colors.teal.withOpacity(0.3)
    }
  ];

  /// Selected Item
  static String selectedItem = "Canada";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Custom Radio List Group:"),
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
                      value: itemList[index]['title'],
                      groupValue: selectedItem,
                      borderColor: Colors.grey.withOpacity(0.3),
                      borderWidth: 1,
                      tileColor: itemList[index]['color'],
                      selectedRadioIconData: CupertinoIcons.checkmark_seal_fill,
                      unselectedRadioIconData: CupertinoIcons.checkmark_seal,
                      trailingWidget: Text(itemList[index]['rank']),
                      onChanged: (val) {
                        setState(() {
                          selectedItem = val!;
                        });
                      },
                      title: itemList[index]['title'])),
            ),
          ),
        )
      ],
    );
  }
}
