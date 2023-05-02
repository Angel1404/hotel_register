import 'package:flutter/material.dart';
import 'package:hotel_r/ui/theme/theme.dart';

class ButtonGenery extends StatelessWidget {
  const ButtonGenery({super.key, this.onPressed, required this.titleBtn, this.colorBtn, this.minSizeW, this.minSizeH});
  final Function()? onPressed;
  final String titleBtn;
  final Color? colorBtn;
  final double? minSizeW;
  final double? minSizeH;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(minSizeW ?? 250, minSizeH ?? 45),
          maximumSize: const Size(400, 62),
          backgroundColor: colorBtn,
        ),
        child: Text(
          titleBtn,
          style: ThemeInfo.styleText.copyWith(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
