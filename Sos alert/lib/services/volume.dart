import 'dart:async';
import 'package:hardware_buttons/hardware_buttons.dart' as HardwareButtons;

class VolumeService {
  int _volumeDownCount = 0;
  DateTime? _firstPressTime;
  Function? _onTriggerCallback;

  late StreamSubscription<HardwareButtons.VolumeButtonEvent> _subscription;

  void startListening({required Function onTrigger}) {
    _onTriggerCallback = onTrigger;

    _subscription = HardwareButtons.volumeButtonEvents.listen((event) {
      if (event == HardwareButtons.VolumeButtonEvent.VOLUME_DOWN) {
        final now = DateTime.now();

        if (_firstPressTime == null ||
            now.difference(_firstPressTime!).inSeconds > 5) {
          _firstPressTime = now;
          _volumeDownCount = 1;
        } else {
          _volumeDownCount++;
        }

        if (_volumeDownCount == 3) {
          _volumeDownCount = 0;
          _firstPressTime = null;
          _onTriggerCallback?.call();
        }
      }
    });
  }

  void stopListening() {
    _subscription.cancel();
  }
}
