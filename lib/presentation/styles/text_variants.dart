import 'package:flutter/material.dart';

///
class TextVariant extends StatelessWidget {
  ///
  final String data;

  ///
  final TextVariantType variantType;

  ///
  final Color? color;

  ///
  final FontWeight? fontWeight;

  ///
  final int? maxLines;

  ///
  final TextOverflow? overflow;

  ///
  final TextAlign? textAlign;

  ///
  final FontStyle? fontStyle;

  ///
  const TextVariant(
      {Key? key,
      required this.data,
      this.maxLines,
      this.variantType = TextVariantType.bodyMedium,
      this.fontStyle,
      this.fontWeight,
      this.overflow,
      this.color,
      this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(data,
        style: getTextStyle(context),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow);
  }

  ///
  TextStyle getTextStyle(BuildContext context) {
    TextStyle textStyle;
    TextTheme textTheme = Theme.of(context).textTheme;
    switch (variantType) {
      case TextVariantType.bodyLarge:
        textStyle = textTheme.bodyLarge!;
        break;
      case TextVariantType.bodyMedium:
        textStyle = textTheme.bodyMedium!;
        break;
      case TextVariantType.bodySmall:
        textStyle = textTheme.bodySmall!;
        break;
      case TextVariantType.labelLarge:
        textStyle = textTheme.labelLarge!;
        break;
      case TextVariantType.labelMedium:
        textStyle = textTheme.labelMedium!;
        break;
      case TextVariantType.labelSmall:
        textStyle = textTheme.labelSmall!;
        break;
      case TextVariantType.titleLarge:
        textStyle = textTheme.titleLarge!;
        break;
      case TextVariantType.titleMedium:
        textStyle = textTheme.titleMedium!;
        break;
      case TextVariantType.titleSmall:
        textStyle = textTheme.titleSmall!;
        break;
      case TextVariantType.headlineLarge:
        textStyle = textTheme.headlineLarge!;
        break;
      case TextVariantType.headlineMedium:
        textStyle = textTheme.headlineMedium!;
        break;
      case TextVariantType.headlineSmall:
        textStyle = textTheme.headlineSmall!;
        break;
      case TextVariantType.displayLarge:
        textStyle = textTheme.displayLarge!;
        break;
      case TextVariantType.displayMedium:
        textStyle = textTheme.displayMedium!;
        break;
      case TextVariantType.displaySmall:
        textStyle = textTheme.displaySmall!;
        break;
      default:
        textStyle = textTheme.bodyMedium!;
        break;
    }
    if (color != null) {
      textStyle = textStyle.copyWith(color: color);
    }
    if (fontWeight != null) {
      textStyle = textStyle.copyWith(fontWeight: fontWeight);
    }
    if (fontStyle != null) {
      textStyle = textStyle.copyWith(fontStyle: fontStyle);
    }
    return textStyle;
  }
}

///
enum TextVariantType {
  ///
  bodyLarge,

  ///
  bodyMedium,

  ///
  bodySmall,

  ///
  labelLarge,

  ///
  labelMedium,

  ///
  labelSmall,

  ///
  titleLarge,

  ///
  titleMedium,

  ///
  titleSmall,

  ///
  headlineLarge,

  ///
  headlineMedium,

  ///
  headlineSmall,

  ///
  displayLarge,

  ///
  displayMedium,

  ///
  displaySmall
}
