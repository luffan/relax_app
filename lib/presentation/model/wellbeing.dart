import 'package:relax_app/presentation/resource/app_vector_asset.dart';

enum Wellbeing {
  calm,
  relaxed,
  focused,
}

extension WellbeingExt on Wellbeing {
  String get icon {
    switch (this) {
      case Wellbeing.calm:
        return AppVectorAsset.calm;
      case Wellbeing.relaxed:
        return AppVectorAsset.relax;
      case Wellbeing.focused:
        return AppVectorAsset.focused;
    }
  }

  String get helpMessage {
    switch (this) {
      case Wellbeing.calm:
        return 'Don\'t be sad';
      case Wellbeing.relaxed:
        return 'Keep calm';
      case Wellbeing.focused:
        return 'Focused on your self';
    }
  }
}
