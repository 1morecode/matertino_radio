import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'matertino_radio_list_tile.dart';

class MatertinoBottomSheetRadio extends StatefulWidget {
  /// Radio Icon Color
  final Color? radioColor;

  /// Selected Radio Color
  final Color? selectedRadioColor;

  /// Spacing Between Icon and Title
  final double? radioTextSpacing;

  /// List Title Padding
  final EdgeInsetsGeometry? contentPadding;

  /// Radio Icon Size
  final double? radioSize;

  /// List Tile Border Color
  final Color? borderColor;

  /// List Tile Border Width
  final double? borderWidth;

  /// Selected Radio Icon
  final IconData? selectedRadioIconData;

  /// Un-Selected Radio Icon
  final IconData? unselectedRadioIconData;

  /// Trailing Widget
  final Widget? trailingWidget;

  /// Tile Background Color
  final Color? tileColor;

  /// Item List
  final List<dynamic> list;

  /// Bottom Sheet Title
  final String heading;

  /// Selected Value
  final String? selected;

  /// On Select Callback Function
  final Function onSelect;

  /// Bottom Sheet Height
  final double height;

  /// Any Widget
  final Widget child;

  /// Radio Text Style
  final TextStyle? radioTextStyle;

  /// Title Maximum Line
  final int radioTextMaximumLine;

  /// Bottom Sheet Heading Style
  final TextStyle? headingStyle;

  /// Finish Button Text
  final String? doneButtonText;

  /// Finish Button Text Style
  final TextStyle? doneTextStyle;

  /// Search Field Decoration
  final BoxDecoration? searchFieldDecoration;

  /// Search Field Placeholder
  final TextStyle? searchPlaceholderStyle;

  /// Search Input Text Style
  final TextStyle? searchTextStyle;

  /// Show/Hide Search Feature
  final bool isSearchEnable;

  /// Enable/Disable On Radio Tap Select
  final bool selectOnRadioTap;

  const MatertinoBottomSheetRadio(
      {Key? key,
      required this.child,
      required this.list,
      this.selected,
      required this.onSelect,
      this.heading = 'Select',
      this.height = 0.8,
      this.radioColor,
      this.headingStyle,
      this.isSearchEnable = true,
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
      this.selectOnRadioTap = false,
      this.borderWidth,
      this.radioTextMaximumLine = 2,
      this.selectedRadioIconData,
      this.unselectedRadioIconData,
      this.trailingWidget,
      this.tileColor})
      : super(key: key);

  @override
  State<MatertinoBottomSheetRadio> createState() =>
      _MatertinoBottomSheetRadioState();
}

class _MatertinoBottomSheetRadioState extends State<MatertinoBottomSheetRadio> {
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
                                color: Colors.grey,
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
                if (widget.isSearchEnable)
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
                  color: widget.borderColor ?? Colors.grey.withOpacity(0.3),
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
                      itemBuilder: (context, index) => MatertinoRadioListTile(
                        value: itemList[index],
                        groupValue: selected ?? "",
                        onChanged: (val) {
                          setState(() {
                            selected = val;
                          });
                          if (widget.selectOnRadioTap) {
                            widget.onSelect(selected);
                            Navigator.of(context).pop();
                          }
                        },
                        radioSize: widget.radioSize,
                        radioTextSpacing: widget.radioTextSpacing,
                        selectedRadioColor: widget.selectedRadioColor,
                        radioColor: widget.radioColor,
                        contentPadding: widget.contentPadding,
                        borderWidth: widget.borderWidth ?? 1,
                        tileColor: widget.tileColor,
                        borderColor:
                            widget.borderColor ?? Colors.grey.withOpacity(0.3),
                        titleStyle: widget.radioTextStyle,
                        title: itemList[index],
                        selectedRadioIconData: widget.selectedRadioIconData,
                        unselectedRadioIconData: widget.unselectedRadioIconData,
                        trailingWidget: widget.trailingWidget,
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
