import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatertinoRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final Color? radioColor;
  final Color? selectedRadioColor;
  final String title;
  final TextStyle? titleStyle;
  final double? radioTextSpacing;
  final EdgeInsetsGeometry? contentPadding;
  final ValueChanged<T?> onChanged;
  final double? radioSize;
  final Color? borderColor;
  final double? borderWidth;
  final IconData? selectedRadioIconData;
  final IconData? unselectedRadioIconData;
  final Widget? trailingWidget;
  final Color? tileColor;

  const MatertinoRadioListTile({
    Key? key,
    required this.value,
    this.radioColor,
    this.selectedRadioColor,
    required this.groupValue,
    required this.onChanged,
    this.radioTextSpacing,
    required this.title,
    this.titleStyle,
    this.contentPadding,
    this.radioSize,
    this.borderColor,
    this.borderWidth, this.selectedRadioIconData,
    this.unselectedRadioIconData, this.trailingWidget, this.tileColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        padding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: tileColor ?? Colors.white,
            border: Border(
                bottom: BorderSide(
                    color: borderColor ?? Colors.transparent,
                    width: borderWidth ?? 0))),
        child: Row(
          children: [
            customRadioIcon(context),
            SizedBox(width: radioTextSpacing ?? 12),
            Expanded(
                child: Text(
              title,
              style: titleStyle ??
                  TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
            )),
            if(trailingWidget != null)
            SizedBox(width: radioTextSpacing ?? 12),
            if(trailingWidget != null)
              trailingWidget!
          ],
        ),
      ),
    );
  }

  Widget customRadioIcon(BuildContext context) {
    final isSelected = value == groupValue;
    return Icon(
      isSelected ? selectedRadioIconData ?? CupertinoIcons.checkmark_circle_fill : unselectedRadioIconData ?? CupertinoIcons.checkmark_circle,
      color: isSelected
          ? selectedRadioColor ?? Theme.of(context).colorScheme.primary
          : radioColor ?? Colors.grey.withOpacity(0.5),
      size: radioSize ?? 24,
    );
  }
}
