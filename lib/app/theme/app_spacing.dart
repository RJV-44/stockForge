import 'package:flutter/material.dart';

class AppSpacing {
  AppSpacing._();

  static const double xxs = 2.0;
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;

  static const EdgeInsets pAllXs = EdgeInsets.all(xs);
  static const EdgeInsets pAllSm = EdgeInsets.all(sm);
  static const EdgeInsets pAllMd = EdgeInsets.all(md);
  static const EdgeInsets pAllLg = EdgeInsets.all(lg);
  static const EdgeInsets pAllXl = EdgeInsets.all(xl);

  static const SizedBox gapH4 = SizedBox(height: xs);
  static const SizedBox gapH8 = SizedBox(height: sm);
  static const SizedBox gapH16 = SizedBox(height: md);
  static const SizedBox gapH24 = SizedBox(height: lg);
  static const SizedBox gapH32 = SizedBox(height: xl);

  static const SizedBox gapW4 = SizedBox(width: xs);
  static const SizedBox gapW8 = SizedBox(width: sm);
  static const SizedBox gapW16 = SizedBox(width: md);
  static const SizedBox gapW24 = SizedBox(width: lg);
  static const SizedBox gapW32 = SizedBox(width: xl);
}
