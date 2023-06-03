import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'matertino_radio_list_tile.dart';

class MatertinoBottomSheetRadio extends StatefulWidget {
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
  final bool isSearchEnable;
  final bool selectOnRadioTap;
  final IconData? selectedRadioIconData;
  final IconData? unselectedRadioIconData;
  final Widget? trailingWidget;
  final Color? tileColor;

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
      this.unselectedRadioIconData, this.trailingWidget, this.tileColor})
      : super(key: key);

  @override
  State<MatertinoBottomSheetRadio> createState() => _MatertinoBottomSheetRadioState();
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
