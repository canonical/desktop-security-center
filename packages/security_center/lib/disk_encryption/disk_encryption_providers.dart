import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:security_center/services/disk_encryption_service.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

part 'disk_encryption_providers.g.dart';

@riverpod
class CheckRecoveryKeyDialogModel extends _$CheckRecoveryKeyDialogModel {
  late final _service = getService<DiskEncryptionService>();
  final validKey = false;

  @override
  CheckRecoveryKeyDialogState build() => CheckRecoveryKeyDialogState.empty();

  Future<void> checkRecoveryKey() async {
    // Ensure the state is in input mode before checking the key.
    assert(state is CheckRecoveryKeyDialogStateInput);
    final keyToCheck = (state as CheckRecoveryKeyDialogStateInput).keyToCheck;

    // Validate the key is not empty.
    if (keyToCheck.isEmpty) {
      state = CheckRecoveryKeyDialogState.error(
        Exception('Recovery key cannot be empty'),
      );
      return;
    }

    // Set the state to loading while checking the key.
    state = CheckRecoveryKeyDialogState.loading();
    try {
      final result = await _service.checkRecoveryKey(keyToCheck);
      state = CheckRecoveryKeyDialogState.result(result);
    } on Exception catch (e) {
      state = CheckRecoveryKeyDialogState.error(e);
    }
  }

  void setKeyToCheck(String key) {
    if (key.isEmpty) {
      state = CheckRecoveryKeyDialogState.empty();
    } else {
      state = CheckRecoveryKeyDialogState.input(key);
    }
  }

  bool getCheckResult() {
    assert(state is CheckRecoveryKeyDialogStateResult);
    return (state as CheckRecoveryKeyDialogStateResult).valid;
  }

  Exception getError() {
    assert(state is CheckRecoveryKeyDialogStateError);
    return (state as CheckRecoveryKeyDialogStateError).e;
  }
}
