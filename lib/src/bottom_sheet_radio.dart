
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_radio_list_tile.dart';

class BottomSheetRadio extends StatefulWidget {
  final List<dynamic> list;
  final String heading;
  final String? selected;
  final Function onSelect;
  final double height;
  final Widget child;
  final Color? radioColor;
  final Color? selectedRadioColor;
  final TextStyle? radioTextStyle;
  final int radioTextMaximumLine;
  final double? radioTextSpacing;
  final EdgeInsetsGeometry? contentPadding;
  final double? radioSize;
  final TextStyle? headingStyle;
  final String? doneButtonText;
  final TextStyle? doneTextStyle;
  final BoxDecoration? searchFieldDecoration;
  final TextStyle? searchPlaceholderStyle;
  final TextStyle? searchTextStyle;
  final Color? borderColor;
  final double? borderWidth;

  const BottomSheetRadio(
      {Key? key,
      required this.child,
      required this.list,
      this.selected,
      required this.onSelect,
      this.heading = 'Select',
      this.height = 0.8,
      this.radioColor,
      this.headingStyle,
      this.selectedRadioColor,
      this.radioTextStyle,
      this.radioTextSpacing,
      this.contentPadding,
      this.radioSize,
      this.doneButtonText,
      this.doneTextStyle,
      this.searchFieldDecoration,
      this.searchPlaceholderStyle,
      this.searchTextStyle,
      this.borderColor,
      this.borderWidth,
      this.radioTextMaximumLine = 2})
      : super(key: key);

  @override
  State<BottomSheetRadio> createState() => _BottomSheetRadioState();
}

class _BottomSheetRadioState extends State<BottomSheetRadio> {
  final TextEditingController searchEditingController = TextEditingController();
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        widget.child,
        CupertinoButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {
            FocusScope.of(context).unfocus();
            setState(() {
              searchEditingController.clear();
              selected = widget.selected;
            });
            showPopup(context);
          },
          child: Container(),
        )
      ],
    );
  }

  showPopup(context) {
    showModalBottomSheet<void>(
      context: context,
      elevation: 1,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) => FractionallySizedBox(
            heightFactor: widget.height,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.heading,
                        style: widget.headingStyle ??
                            TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                      ),
                      CupertinoButton(
                        onPressed: () {
                          if (selected != null) {
                            widget.onSelect(selected);
                          }
                          Navigator.of(context).pop();
                        },
                        padding: const EdgeInsets.all(5),
                        minSize: 35,
                        child: Text(
                          widget.doneButtonText ?? "Done",
                          style: widget.doneTextStyle ??
                              TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoSearchTextField(
                    controller: searchEditingController,
                    decoration: widget.searchFieldDecoration,
                    placeholderStyle: widget.searchPlaceholderStyle,
                    style: widget.searchTextStyle,
                    onChanged: (val) {
                      setState(() {});
                    },
                  ),
                ),
                Divider(
                  height: widget.borderWidth ?? 1,
                  thickness: widget.borderWidth ?? 1,
                  color: widget.borderColor ??
                      Theme.of(context).colorScheme.onSurface,
                ),
                Expanded(child: Builder(
                  builder: (context) {
                    List<dynamic> itemList = [];
                    if (searchEditingController.text.isNotEmpty) {
                      for (var role in widget.list) {
                        if (role.toUpperCase().contains(
                            searchEditingController.text.toUpperCase())) {
                          itemList.add(role);
                        }
                      }
                    } else {
                      itemList = widget.list;
                    }
                    return ListView.builder(
                      itemBuilder: (context, index) => CustomRadioListTile(
                        value: itemList[index],
                        groupValue: selected ?? "",
                        onChanged: (val) {
                          setState(() {
                            selected = val;
                          });
                        },
                        radioSize: widget.radioSize,
                        radioTextSpacing: widget.radioTextSpacing,
                        selectedRadioColor: widget.selectedRadioColor,
                        radioColor: widget.radioColor,
                        contentPadding: widget.contentPadding,
                        borderWidth: widget.borderWidth ?? 1,
                        borderColor: widget.borderColor ??
                            Theme.of(context).colorScheme.onSurface,
                        titleStyle: widget.radioTextStyle,
                        title: itemList[index],
                      ),
                      itemCount: itemList.length,
                    );
                  },
                )),
              ],
            ),
          ),
        );
      },
    );
  }
}
