import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hotel_r/ui/theme/theme.dart';

class AutoSizeTextApp extends StatelessWidget {
  const AutoSizeTextApp({super.key, required this.title, this.textStyle, this.textAlign, this.minFontSize, this.maxLines, this.fontSize});
  final String title;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final double? minFontSize;
  final int? maxLines;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title,
      style: textStyle ?? ThemeInfo.styleText,
      softWrap: true,
      maxLines: maxLines,
      textAlign: textAlign ?? TextAlign.center,
      minFontSize: minFontSize ?? 10,
      stepGranularity: minFontSize ?? 10,
      overflow: TextOverflow.ellipsis,
    );
  }
}
