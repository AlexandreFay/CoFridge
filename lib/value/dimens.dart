class MyDimens {
  static double screenWidth;
  static double screenHeight;

  static final double paddingAll = 8.0;
  static final double paddingVertical = 16.0;
  static final double paddingHorizontal = 8.0;
  static final double paddingTop = 16.0;
  static final double paddingRight = 8.0;
  static final double paddingBottom = 16.0;
  static final double paddingLeft = 8.0;

  static final double dividerAll = 16.0;
  static final double dividerTop = 32.0;
  static final double dividerRight = 16.0;
  static final double dividerBottom = 32.0;
  static final double dividerLeft = 16.0;

  static final double lineSpace = 8.0;

  static final double logoRatio = 0.70;

  static final double datePickerHeaderPortraitHeight = 100.0;
  static final double datePickerHeaderLandscapeWidth = 168.0;

  static final Duration monthScrollDuration = Duration(milliseconds: 200);
  static final double dayPickerRowHeight = 42.0;

  /// A 31 day month that starts on Saturday.
  static final int maxDayPickerRowCount = 6;

  /// Two extra rows: one for the day-of-week header and one for the month header.
  static final double maxDayPickerHeight =
      dayPickerRowHeight * (maxDayPickerRowCount + 2);

  static final double monthPickerPortraitWidth = 330.0;
  static final double monthPickerLandscapeWidth = 344.0;

  static final double dialogActionBarHeight = 52.0;
  static final double datePickerLandscapeHeight =
      maxDayPickerHeight + dialogActionBarHeight;
}
