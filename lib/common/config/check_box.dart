import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    required this.isDisable,
    required this.isCheck,
    required this.onChanged,
    super.key,
  });
  final bool isDisable;
  final bool isCheck;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) => Checkbox(
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) => states.contains(MaterialState.disabled)
              ? Colors.grey.shade400
              : !isCheck
                  ? Colors.grey.shade200
                  : Colors.blue.shade50,
        ),
        activeColor: isDisable ? Colors.grey[400] : Colors.blue[300],
        fillColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) =>
              states.contains(MaterialState.disabled) ? Colors.grey.shade400 : Colors.blue.shade300,
        ),
        side: MaterialStateBorderSide.resolveWith(
          (states) => BorderSide(
            width: 1.0,
            color: isDisable
                ? Colors.grey.shade400
                : isCheck
                    ? Colors.blue.shade300
                    : Colors.black,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        value: isCheck,
        onChanged: isDisable ? null : onChanged,
      );
}
