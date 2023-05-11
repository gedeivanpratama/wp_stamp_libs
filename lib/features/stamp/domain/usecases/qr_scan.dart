import 'package:appkey_wp_stamp_module/features/stamp/domain/repositories/stamp_repository.dart';

abstract class StampScanUseCase<Type> {
  Future<bool> call(String url);
}

class QrScan implements StampScanUseCase<bool> {
  final StampRepository repository;

  QrScan(this.repository);

  @override
  Future<bool> call(String url) async {
    return repository.qrScan(url);
  }
}
