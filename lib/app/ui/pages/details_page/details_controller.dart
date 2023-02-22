import 'dart:async';

import 'package:siente_app/app/data/models/datos_proyecto.dart';
import 'package:siente_app/app/data/models/design/drowpdown_card.dart';
import 'package:siente_app/app/ui/utils/time_left.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  DatosProyecto? detallesProyecto = Get.arguments as DatosProyecto?;
  late Timer _timer;
  int days = 0;
  int hours = 0;
  int minutes = 0;
  int seconds = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _startTimer();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    closeAllDropDowns();
    _timer.cancel();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      final DateTime now = DateTime.now();
      final DateTime limit = detallesProyecto!.finProyecto ?? now;

      days = TimeLeft().daysLeft(
        now: now,
        limit: limit,
      );
      hours = TimeLeft().hoursLeft(
        now: now,
        limit: limit,
        daysLeft: days,
      );
      minutes = TimeLeft().minutesLeft(
        now: now,
        limit: limit,
        daysLeft: days,
        hourLeft: hours,
      );
      seconds = TimeLeft().secondsLeft(
        now: now,
        limit: limit,
        daysLeft: days,
        hourLeft: hours,
        minuteLeft: minutes,
      );
      update(<Object>['count_down']);
      if (days == 0 && hours == 0 && minutes == 0 && seconds == 0) {
        _timer.cancel();
      }
    });
  }

  //the birthday's date

  void openCloseDropDown(int index) {
    if (DropDownCard.listDropDownCards[index].isOpen) {
      DropDownCard.listDropDownCards[index].isOpen = false;
      update(<Object>['details_list']);
      return;
    }
    closeAllDropDowns();
    DropDownCard.listDropDownCards[index].isOpen =
        !DropDownCard.listDropDownCards[index].isOpen;
    update(<Object>['details_list']);
  }

  void closeAllDropDowns() {
    for (int i = 0; i < DropDownCard.listDropDownCards.length; i++) {
      DropDownCard.listDropDownCards[i].isOpen = false;
    }
  }
}
