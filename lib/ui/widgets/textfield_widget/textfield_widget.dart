import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final IconData icon;
  final Icon prefixIcon;
  final IconButton suffixIcon;
  final String hint;
  final String errorText;
  final bool isObscure;
  final bool isIcon;
  final TextInputType inputType;
  final TextEditingController textController;
  final EdgeInsets padding;
  final Color hintColor;
  final Color iconColor;
  final FocusNode focusNode;
  final ValueChanged onFieldSubmitted;
  final bool autoFocus;
  final TextInputAction inputAction;
  final List<TextInputFormatter> inputFormatters;
  final TextStyle style;
  final int maxLength;
  

  const TextFieldWidget(
      {Key key,
      this.icon,
      this.prefixIcon,
      this.suffixIcon,
      this.hint,
      this.errorText,
      this.isObscure = false,
      this.inputType,
      this.inputFormatters,
      this.textController,
      this.isIcon = true,
      this.padding = const EdgeInsets.all(0),
      this.hintColor = Colors.grey,
      this.iconColor = Colors.grey,
      this.focusNode,
      this.onFieldSubmitted,
      this.autoFocus = false,
      this.inputAction,
      this.maxLength = 25,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: textController,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        autofocus: autoFocus,
        inputFormatters: inputFormatters,
        textInputAction: inputAction,
        obscureText: this.isObscure,
        maxLength: maxLength,
        keyboardType: this.inputType,
        style: style,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: this.hint,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintStyle:
              Theme.of(context).textTheme.bodyText2.copyWith(color: hintColor),
          errorText: errorText,
          counterText: '',
          // icon: this.isIcon ? Icon(this.icon, color: iconColor) : null
        ),
      ),
    );
  }
}
