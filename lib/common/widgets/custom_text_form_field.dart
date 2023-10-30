import 'package:popticle_flutter_unity/common/const/colors.dart';
import 'package:flutter/material.dart';


class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? labelText; // 추가: 라벨 텍스트
  final bool isRequired; // 추가: 필드가 필수인지 아닌지
  final String? errorText;
  final bool obscureText;
  final bool autofocus;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller; // 추가: 컨트롤러
  final TextInputType keyboardType; // 추가: 키보드 유형
  final TextInputAction? textInputAction; // 추가: 키보드 액션

  const CustomTextFormField({
    required this.onChanged,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.isRequired = false,
    this.labelText,
    this.autofocus = false,
    this.obscureText = false,
    this.hintText,
    this.errorText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: INPUT_BORDER_COLOR,
        width: 1.0,
      ),
    );

    return TextFormField(
      cursorColor: PRIMARY_COLOR,
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      autofocus: autofocus,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20),
        labelText: isRequired ? "$labelText *" : labelText, // 필수 표시
        hintText: hintText,
        errorText: errorText,
        hintStyle: TextStyle(
          color: BODY_TEXT_COLOR,
          fontSize: 14.0,
        ),
        fillColor: INPUT_BG_COLOR,
        filled: true,
        border: baseBorder,
        enabledBorder: baseBorder,
        focusedBorder: baseBorder.copyWith(
          borderSide: baseBorder.borderSide.copyWith(
            color: PRIMARY_COLOR,
          ),
        ),
      ),
    );
  }
}
