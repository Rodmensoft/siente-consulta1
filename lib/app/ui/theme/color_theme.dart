import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorTheme {
  static const Color primary = Color(0xff575A9D);
  static const Color primaryTint = Color(0xff002F5E);
  static const Color secondary = Color(0xff3FA57E);
  static const Color secondaryTint = Color(0xff76BB5A);
  static const Color tertiary = Color(0xff4BCBF1);
  static const Color tertiaryTint = Color(0xff4C85FC);
  static const Color rightArrowButton = Color(0xff4DBF7F);

  static const Color success = Color(0xff51D686);
  static const Color successAlt = Color(0xff8DC449);
  static const Color successTint = Color(0xff56D5A3);
  static const Color warning = Color(0xff8B4087);
  static const Color danger = Color(0xffF4917C);
  static const Color danger2 = Color(0xffD41F6B);

  static const Color dark = Color(0xff1a1a1a);
  static const Color darkOpaque = Color(0xff666666);

  static const Color medium = Color(0xff808080);
  static const Color mediumshade = Color(0xff717171);
  static const Color mediumtint = Color(0xffa6ada6);

  static const Color light = Color(0xffF2F2F2);
  static const Color darklight = Color(0xffE2E2E2);
  static const Color lightshade = Color(0xffF4F4F4);
  static const Color lighttint = Color(0xffD8D8D8);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);

  static const Color bgScaffold = Color(0xffF6F4FC);

  static const Color detailsText = Color(0xff556A8D);
  static const Color detailsText2 = Color(0xff5994EF);
  static const Color detailsRating = Color(0xff4D4D4D);
  static const Color detailsRating2 = Color(0xffC4C4C4);
  static const Color detailsRatingIcon = Color(0xff6AE0A0);
  static const Color detailsLine = Color(0xff979797);

  static const Color newButton1 = Color(0xff27A5A8);
  static const Color newButton2 = Color(0xff4050B4);
  static const Color newButton3 = Color(0xff2195F2);
  static const Color newButton4 = Color(0xff4CAF51);
  static const Color newButton5 = Color(0xff159687);
  static const Color newButton6 = Color(0xffE49804);

  static LinearGradient splashGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.004, 1],
    colors: [
      Color(0xFF002F5E),
      Color(0xFF575A9D),
    ],
    transform: GradientRotation(168.03 * (3.141592 / 180)),
  );

  static const LinearGradient congratsGradient = LinearGradient(
    stops: <double>[-0.6, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    tileMode: TileMode.mirror,
    colors: <Color>[
      Color(0xff575A9D),
      Color(0xff002F5E),
    ],
  );
  static const LinearGradient cardGradient = LinearGradient(
    stops: <double>[-0.431, 1.174],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    tileMode: TileMode.mirror,
    colors: <Color>[
      Color(0xff9482FF),
      Color(0xff745FF2),
    ],
  );
  static const LinearGradient buttonGradient = LinearGradient(
    stops: <double>[-0.2898, 1.2332],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    tileMode: TileMode.mirror,
    colors: <Color>[
      Color(0xff239A90),
      Color(0xff8DC449),
    ],
  );
  static const LinearGradient mapGradient = LinearGradient(
    stops: <double>[0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    tileMode: TileMode.mirror,
    colors: <Color>[Color.fromRGBO(0, 0, 0, 0.21), Color.fromRGBO(0, 0, 0, 0)],
  );
  static const LinearGradient timeGradient = LinearGradient(
    stops: <double>[0.08, 0.7856],
    transform: GradientRotation(1.1716395),
    tileMode: TileMode.mirror,
    colors: <Color>[
      Color(0xffF15A24),
      Color(0xffFD9700),
    ],
  );
}
