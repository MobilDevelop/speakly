import 'dart:ui';

abstract class BaseColors {
  const BaseColors();

  Color get primary => const Color.fromRGBO(157, 129, 255, 1);

  Color get stroke => const Color.fromRGBO(50, 58, 70, 1);
  Color get information => const Color.fromRGBO(55, 135, 255, 1);
  Color get backcolor => const Color.fromRGBO(245, 245, 245, 1);
  Color get linecolor => const Color.fromRGBO(222, 227, 222, 1);
  Color get indicatorcolor => const Color.fromRGBO(215, 218, 215, 1);
  Color get iconcolor => const Color.fromRGBO(187, 192, 187, 1);

  Color get white => const Color.fromRGBO(255, 255, 255, 1);
  Color get blackGreen => const Color.fromRGBO(22, 101, 22, 1);
  Color get green => const Color.fromRGBO(97, 191, 57, 1);
  Color get green2 => const Color.fromRGBO(22, 101, 22, 1);
  Color get green3 => const Color.fromRGBO(1, 192, 0, 1);
  Color get green4 => const Color.fromRGBO(0, 173, 49, 1);
  Color get grey => const Color.fromRGBO(121,129,121, 1);
  Color get grey1 => const Color.fromRGBO(158,158,158, 1);
  Color get whiteBack => const Color.fromRGBO(244,244,244, 1);
  Color get greysoft => const Color.fromRGBO(239,239,239, 1);
  Color get icongrey => const Color.fromRGBO(187, 192, 187, 1);
  Color get red => const Color.fromRGBO(255, 97, 45, 1);
  Color get fiolet => const Color.fromRGBO(92, 106, 196, 1);
  Color get gold => const Color.fromRGBO(246, 196, 65, 1);
  Color get silver => const Color.fromRGBO(190, 198, 202, 1);
  Color get bronze => const Color.fromRGBO(222, 160, 0, 1);
  Color get green1 => const Color.fromRGBO(92, 196, 152, 1);
  Color get orange => const Color.fromRGBO(227, 177, 0, 1);
  Color get snow => const Color.fromRGBO(240, 255, 255, 1);

  Color get black => const Color.fromRGBO(0, 0, 0, 1);
  Color get text900 => const Color.fromRGBO(0, 0, 0, 1);
  Color get text800 => const Color.fromRGBO(54, 69, 79, 1);
  Color get text700 => const Color.fromRGBO(51, 51, 51, 1);
 
  Color get textSecondary => const Color.fromRGBO(137, 143, 147, 1);

  Color get background;
}
