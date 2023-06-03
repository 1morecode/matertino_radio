import 'package:flutter/material.dart';
import 'package:matertino_radio/matertino_radio.dart';

class GenderRadioGroup extends StatefulWidget {
  const GenderRadioGroup({Key? key}) : super(key: key);

  @override
  State<GenderRadioGroup> createState() => _GenderRadioGroupState();
}

class _GenderRadioGroupState extends State<GenderRadioGroup> {
  static List<Map<String, dynamic>> genderList = [
    {"gender": "Male", "iconData": Icons.male_rounded},
    {"gender": "Female", "iconData": Icons.female_rounded},
    {"gender": "Other", "iconData": Icons.alt_route_rounded}
  ];
  static String selectedGender = "Female";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Select Gender Radio Group:"),
        const SizedBox(
          height: 5,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey.withOpacity(0.3), width: 1),
                borderRadius: BorderRadius.circular(8)),
            margin: const EdgeInsets.all(0),
            child: Row(
              children: List.generate(
                genderList.length,
                (index) => Expanded(
                  child: MatertinoRadioListTile(
                    value: genderList[index]['gender'],
                    groupValue: selectedGender,
                    title: genderList[index]['gender'],
                    selectedRadioIconData: genderList[index]['iconData'],
                    unselectedRadioIconData: genderList[index]['iconData'],
                    onChanged: (val) {
                      setState(() {
                        selectedGender = val!;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
