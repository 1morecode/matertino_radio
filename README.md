<h2 align="center">Matertino Radio</h1>

<p align="center">
Fully Customizable Radio Group Package Developed By <a href="https://1morecode.com">1 More Code</a>.
</p>

[![pub package](https://img.shields.io/badge/pub-v1.0.5-blue)](https://pub.dev/packages/matertino_radio) [![Build Status](https://img.shields.io/badge/publisher-1morecode.com-lightgrey)](https://1morecode.com)

## Development

A Beautiful and Simple Custom Radio Group widget for Flutter. It can be fully customized with label, titles, labelStyle, titleStyle, radioIcons, etc. It also contains single radio list tile. You can use this library with bottom sheet radio group as modern dropdown with search feature.

### Demo Screenshot of `MatertinoRadio`:

| ![](https://github.com/1morecode/matertino_radio/assets/57178146/b7eaff6e-a665-4735-82dd-972a248ec0ce)  | ![](https://github.com/1morecode/matertino_radio/assets/57178146/173db5e4-9fc4-4103-a196-f7106e2d1a10) | ![](https://github.com/1morecode/matertino_radio/assets/57178146/3ae71a90-4862-4dbf-8506-ea9fd986ea97) |
|:---:|:---:|:---:|

## How to use:

### How to use `MatertinoRadio`:

1. Add `matertino_radio` to your package's pubspec.yaml file:
```dart
dependencies:
  matertino_radio: ^1.0.5
```

1. To use import the `matertino_radio` package:
```dart
import 'package:matertino_radio/matertino_radio.dart';
```

#### How to use `MatertinoBottomSheetRadio` property:

1. Create variables of lists and selectedItem:
```dart
List<String> items = ["Adventure", "Agility", "Cultural Influence", "Entrepreneurship", "Heritage", "Movers", "Open for Business", "Power", "Quality of Life", "Social Purpose"];
  
String? selectedItem;
```
2. Create a `MatertinoBottomSheetRadio`:
```dart
MatertinoBottomSheetRadio(
  list: items,
  selected: selectedItem,
  onSelect: (val) {
    setState(() {
      selectedItem = val;
    });
  },
  child: CupertinoTextField(
    onTap: null,
    controller: TextEditingController(text: selectedItem),
    placeholder: "Select Item",
    enabled: false,
    suffix: const Icon(Icons.arrow_drop_down),
  )
)
```
3. Here is the output:
<p>
<img src="https://github.com/1morecode/matertino_radio/assets/57178146/b7eaff6e-a665-4735-82dd-972a248ec0ce" height="460">
</p>

#### How to use `MatertinoRadio` horizontal custom radio group:

1. Create variables of lists and selectedItem:
```dart
List<Map<String, dynamic>> lists = [
  {"title": "Male", "iconData": Icons.male_rounded},
  {"title": "Female", "iconData": Icons.female_rounded},
  {"title": "Other", "iconData": Icons.alt_route_rounded}
];
String? selectedItem;
```
2. Use of `MatertinoRadioListTile`:
```dart
Row(
  children: List.generate(
    lists.length, 
    (index) => Expanded(
      child: MatertinoRadioListTile(
        value: lists[index]['title'],
        groupValue: selectedItem,
        title: lists[index]['title'],
        onChanged: (val) {
          setState(() {
            selectedItem = val!;
          });
        }
      )
    )
  )
)
```
3. Here is the output:
<p>
<img src="https://github.com/1morecode/matertino_radio/assets/57178146/173db5e4-9fc4-4103-a196-f7106e2d1a10">
</p>

#### How to use `MatertinoRadio` list with custom radio group:

1. Create variables of lists and selectedItem:
```dart
List<Map<String, dynamic>> lists = [
  {"title": "India", "rank": "#1", "color": Colors.cyan.withOpacity(0.3)},
  {"title": "Germany", "rank": "#2", "color": Colors.green.withOpacity(0.3)},
  {"title": "Canada", "rank": "#3", "color": Colors.blue.withOpacity(0.3)},
  {"title": "United States", "rank": "#4", "color": Colors.redAccent.withOpacity(0.3)},
  {"title": "Switzerland", "rank": "#5", "color": Colors.amber.withOpacity(0.3)},
  {"title": "China", "rank": "#6", "color": Colors.teal.withOpacity(0.3)}
];
String? selectedItem;
```
2. Use of `MatertinoRadioListTile`:
```dart
Column(
  children: List.generate(
    lists.length,
    (index) => MatertinoRadioListTile(
      value: lists[index]['title'],
      groupValue: selectedItem,
      title: lists[index]['title'],
      tileColor: itemList[index]['color'],
      trailingWidget: Text(itemList[index]['rank']),
      selectedRadioIconData: CupertinoIcons.checkmark_seal_fill,
      unselectedRadioIconData: CupertinoIcons.checkmark_seal,
      onChanged: (val) {
        setState(() {
          selectedItem = val!;
        });
      }
    )
  )
)
```

3. Here is the output:
<p>
<img src="https://github.com/1morecode/matertino_radio/assets/57178146/3ae71a90-4862-4dbf-8506-ea9fd986ea97">
</p>

#### Example Usage

See [Example Code](example/lib/main.dart) for more info.

### Issues & Feedback

Please file an [issue](https://github.com/1morecode/matertino_radio/issues) to send feedback or report a bug,  
If you want to ask a question or suggest an idea then you can [open an discussion](https://github.com/1morecode/matertino_radio/discussions).  
Thank you!

### Contributing

Every pull request is most welcome 🤝.

### Support

If this package saves your time. You can now buy me a coffee! 

Scan bellow QR code or click and don't forget to leave a message there:

<a href="https://bmc.link/1morecode" target="_blank"><img src="https://github.com/1morecode/matertino_radio/assets/57178146/1995d3e2-b061-4655-81d5-df1d41d9bfb6" alt="Buy Me A Coffee" style="height: 160px !important" ></a>
