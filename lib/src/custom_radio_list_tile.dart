import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRadioListTile<T> extends StatelessWidget {
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

  const CustomRadioListTile({
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
    this.borderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        padding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
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
          ],
        ),
      ),
    );
  }

  Widget customRadioIcon(BuildContext context) {
    final isSelected = value == groupValue;
    return Icon(
      CupertinoIcons.check_mark_circled_solid,
      color: isSelected
          ? selectedRadioColor ?? Theme.of(context).colorScheme.primary
          : radioColor ?? Theme.of(context).colorScheme.background,
      size: radioSize ?? 20,
    );
  }
}
