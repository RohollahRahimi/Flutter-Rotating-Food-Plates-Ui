import 'package:flutter/material.dart';

class UIhelper {
  static const double _VerdicalSpaceVsmall = 10.0;
  static const double _VerdicalSpacesmall = 15.0;
  static const double _VerdicalSpaceMedium = 30.0;
  static const double _VerdicalSpaceLarge = 60.0;

  static const double _HorizontalSpaceVSmall = 10.0;
  static const double _HorizontalSpaceSmall = 15.0;
  static const double _HorizontalSpaceMedium = 30.0;
  static const double _HorizontalSpaceLarge = 60.0;

  static const Widget verdicalSpaceVsmall =
      SizedBox(height: _VerdicalSpaceVsmall);

  static const Widget verdicalSpacesmall =
      SizedBox(height: _VerdicalSpacesmall);

  static const Widget verdicalSpaceMedium =
      SizedBox(height: _VerdicalSpaceMedium);

  static const Widget verdicalSpaceLarge =
      SizedBox(height: _VerdicalSpaceLarge);

  static const Widget horizontalSpaceVsmall =
      SizedBox(width: _HorizontalSpaceVSmall);

  static const Widget horizontalSpacesmall =
      SizedBox(width: _HorizontalSpaceSmall);

  static const Widget horizontalSpaceMedium =
      SizedBox(width: _HorizontalSpaceMedium);

  static const Widget horizontalSpaceLarge =
      SizedBox(width: _HorizontalSpaceLarge);
}
