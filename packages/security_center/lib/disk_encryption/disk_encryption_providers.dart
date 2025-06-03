import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:security_center/services/disk_encryption_service.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

part 'disk_encryption_providers.freezed.dart';
part 'disk_encryption_providers.g.dart';

@freezed
class SystemContainersData with _$SystemContainersData {
  const factory SystemContainersData({
    required List<SystemDataContainer> containers,
    RecoveryKeyDetails? generatedRecoveryKey,
    @Default('') String recoveryKeyToCheck,
    bool? validKey,
  }) = _SystemContainersData;
}

@riverpod
class SystemContainersModel extends _$SystemContainersModel {
  late final _service = getService<DiskEncryptionService>();

  @override
  Future<SystemContainersData> build() async {
    final containers = await _service.enumerateKeySlots();
    return SystemContainersData(containers: containers);
  }

  void setRecoveryKeyToCheck(String key) {
    state = state.whenData(
      (data) => data.copyWith(recoveryKeyToCheck: key, validKey: null),
    );
  }

  Future<void> generateKey() async {
    final details = await _service.generateRecoveryKey();
    state = state.whenData(
      (data) => data.copyWith(generatedRecoveryKey: details),
    );
  }

  Future<void> addRecoveryKey() async {
    final data = state.asData?.value;
    if (data == null || data.generatedRecoveryKey == null) {
      throw Exception('No recovery key generated to add.');
    }
    await _service.addRecoveryKey(data.generatedRecoveryKey!.keyId);
  }

  Future<void> deleteKeySlot(String keyId) async {
    final data = state.asData?.value;
    if (data == null) {
      throw Exception('No system containers data available.');
    }
    await _service.deleteKeySlot(keyId);
    ref.invalidate(systemContainersModelProvider);
  }

  Future<bool> checkRecoveryKey(String recoveryKey) async {
    final result = await _service.checkRecoveryKey(recoveryKey);
    state = state.whenData((data) => data.copyWith(validKey: result));
    return result;
  }
}
