class MyDimens {
  static double screenWidth;
  static double screenHeight;

  static const double paddingAll = 8.0;
  static const double paddingVertical = 16.0;
  static const double paddingHorizontal = 8.0;
  static const double paddingTop = 16.0;
  static const double paddingRight = 8.0;
  static const double paddingBottom = 16.0;
  static const double paddingLeft = 8.0;

  static const double dividerAll = 16.0;
  static const double dividerTop = 32.0;
  static const double dividerRight = 16.0;
  static const double dividerBottom = 32.0;
  static const double dividerLeft = 16.0;

  static const double lineSpace = 8.0;

  static const double logoRatio = 0.1;

  static const double datePickerHeaderPortraitHeight = 100.0;
  static const double datePickerHeaderLandscapeWidth = 168.0;

  static const Duration monthScrollDuration = Duration(milliseconds: 200);
  static const double dayPickerRowHeight = 42.0;

  /// A 31 day month that starts on Saturday.
  static const int maxDayPickerRowCount = 6;

  /// Two extra rows: one for the day-of-week header and one for the month header.
  static const double maxDayPickerHeight = dayPickerRowHeight * (maxDayPickerRowCount + 2);

  static const double monthPickerPortraitWidth = 330.0;
  static const double monthPickerLandscapeWidth = 344.0;

  static const double dialogActionBarHeight = 52.0;
  static const double datePickerLandscapeHeight = maxDayPickerHeight + dialogActionBarHeight;
}
