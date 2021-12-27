import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'at_special_text_span_builder.dart';

class ChatTextField extends StatelessWidget {
  final AtTextCallback? atCallback;
  final Map<String, String> allAtMap;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final ValueChanged<String>? onSubmitted;
  final TextStyle? style;
  final TextStyle? atStyle;

  const ChatTextField({
    Key? key,
    this.allAtMap = const {},
    this.atCallback,
    this.focusNode,
    this.controller,
    this.onSubmitted,
    this.style,
    this.atStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExtendedTextField(
      style: style,
      specialTextSpanBuilder: AtSpecialTextSpanBuilder(
        atCallback: atCallback,
        allAtMap: allAtMap,
        atStyle: atStyle,
      ),
      focusNode: focusNode,
      controller: controller,
      keyboardType: TextInputType.multiline,
      autofocus: false,
      minLines: 1,
      maxLines: 4,
      textInputAction: TextInputAction.newline,
      // onSubmitted: onSubmitted,
      decoration: InputDecoration(
        border: InputBorder.none,
        isDense: true,
        // contentPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 4.w,
          vertical: 8.h,
        ),
      ),
    );
  }
}
