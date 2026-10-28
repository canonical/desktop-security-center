import 'package:security_center/services/power_service.dart';

// Keeps the computer running, so --dry-run can show the steps that restart or
// power off
class FakePowerService implements PowerService {
  @override
  Future<void> reboot() async {}

  @override
  Future<void> powerOff() async {}
}
