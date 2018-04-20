class MyDimens {
  static double screenWidth;
  static double screenHeight;

  static const double padding_all = 8.0;
  static const double padding_top = 8.0;
  static const double padding_right = 15.0;
  static const double padding_bottom = 16.0;
  static const double padding_left = 15.0;

  static const double listTile_all = 10.0;
  static const double listTile_top = 10.0;
  static const double listTile_right = 16.0;
  static const double listTile_bottom = 16.0;
  static const double listTile_left = 16.0;

  static const double divider_all = 15.0;
  static const double divider_top = 15.0;
  static const double divider_right = 32.0;
  static const double divider_bottom = 32.0;
  static const double divider_left = 32.0;

  static const double sign_in_logo_ratio = 0.5;
  static const double sign_in_img_ratio = 0.3;

  static const double iconDefaultSize = 24.0;

  static const double payment_img_ratio = 0.07;

  static const double line_space = 8.0;

  static const double datePickerHeaderPortraitHeight = 100.0;
  static const double datePickerHeaderLandscapeWidth = 168.0;

  static const Duration monthScrollDuration = Duration(milliseconds: 200);
  static const double dayPickerRowHeight = 42.0;
  static const int maxDayPickerRowCount = 6; // A 31 day month that starts on Saturday.
// Two extra rows: one for the day-of-week header and one for the month header.
  static const double maxDayPickerHeight = dayPickerRowHeight * (maxDayPickerRowCount + 2);

  static const double monthPickerPortraitWidth = 330.0;
  static const double monthPickerLandscapeWidth = 344.0;

  static const double dialogActionBarHeight = 52.0;
  static const double datePickerLandscapeHeight = maxDayPickerHeight + dialogActionBarHeight;
}
