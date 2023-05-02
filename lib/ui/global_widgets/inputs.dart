import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/theme.dart';

class InputGenery extends StatefulWidget {
  const InputGenery({
    super.key,
    this.obscureText,
    this.textInputType,
    this.prefixIcon,
    this.onChanged,
    this.hintText,
    this.isPrefixIcon = true,
    this.suixIcon,
    this.isSufixIcon = false,
    this.borderRadius,
    this.onTap,
    this.maxLines,
    this.controller,
    this.initValue,
    this.enable,
    this.padding,
  });

  final bool? obscureText;
  final TextInputType? textInputType;
  final IconData? prefixIcon;
  final bool? suixIcon;
  final Function(String)? onChanged;
  final String? hintText;
  final bool isPrefixIcon;
  final bool isSufixIcon;
  final Function()? onTap;
  final double? borderRadius;
  final int? maxLines;
  final TextEditingController? controller;
  final String? initValue;
  final bool? enable;
  final EdgeInsetsGeometry? padding;

  @override
  State<InputGenery> createState() => _InputGeneryState();
}

class _InputGeneryState extends State<InputGenery> {
  bool isEnablePassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 62,
      width: Get.width,
      constraints: const BoxConstraints(maxHeight: 62, maxWidth: 400),
      padding: widget.padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 10,
            color: Colors.black12,
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: TextFormField(
          enabled: widget.enable,
          controller: widget.controller,
          style: ThemeInfo.styleInputsText,
          keyboardType: widget.textInputType ?? TextInputType.emailAddress,
          obscureText: widget.suixIcon == true ? isEnablePassword : false,
          onTap: widget.onTap,
          onChanged: widget.onChanged,
          cursorColor: Colors.blueAccent[700],
          obscuringCharacter: '-',
          enableIMEPersonalizedLearning: true,
          decoration: InputDecoration(
            hintText: widget.hintText ?? 'Correo',
            hintStyle: ThemeInfo.styleInputsHintText,

            // prefixIcon: !widget.isPrefixIcon ? null : Icon(widget.prefixIcon ?? Icons.email, size: 17),
            // prefixIconColor: !widget.isPrefixIcon ? null : Colors.black87,
            suffixIcon: widget.suixIcon ?? false ? _iconOscureText() : null,
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(widget.borderRadius ?? 12), borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(widget.borderRadius ?? 12), borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }

  Widget _iconOscureText() {
    return IconButton(
      splashRadius: 20,
      splashColor: Colors.blueAccent.withOpacity(.5),
      tooltip: 'Opción para mirar la contraseña',
      icon: Icon(
        !isEnablePassword ? Icons.visibility : Icons.visibility_off,
      ),
      onPressed: () {
        isEnablePassword = !isEnablePassword;
        setState(() {});
      },
    );
  }
}
