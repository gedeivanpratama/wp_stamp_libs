import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../core/static/const.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/datasources/stamp_data_source.dart';
import '../../data/repositories/stamp_repository_impl.dart';
import '../../domain/entities/stamps.dart';
import '../../domain/usecases/get_stamp.dart';
import '../../domain/usecases/qr_scan.dart';

class StampProvider with ChangeNotifier {
  //initial
  late Stamps? _stamps;
  late GetStamp getStamp;
  late QrScan qrScan;
  late StampRepositoryImplementation repo;
  late Dio dio;
  late StampDataSourceImplementation dataSource;
  bool _scanSuccess = false;
  bool _isLoading = false;

  //set
  set setStamps(Stamps? val) {
    _stamps = val;
    notifyListeners();
  }

  set setScanSuccess(val) {
    _scanSuccess = val;
    notifyListeners();
  }

  set setIsLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  //get
  Stamps? getStamps() => _stamps;
  bool get scanSuccess => _scanSuccess;
  bool get isLoading => _isLoading;

  //method
  Future<Stamps?> getStampsFromAPI(int id) async {
    final dummyMap = {
      "max_stamp": 20,
      "stamp_count": 15,
      "stamp": {
        "id": 123,
        "icon": "",
      }
    };
    // final dummyStamp = StampModel.fromJson(dummyMap);
    final result = await getStamp(Params(id: id));
    // print('result:' + result.toString());
    if (result.isRight()) {
      final r = result.getOrElse(() => Stamps());
      setStamps = r;
      return r;
    } else {
      // for testing:
      // setStamps = dummyStamp;
      // return dummyStamp;

      // for production:
      setStamps = null;
      return null;
    }
  }

  refreshStamp() async {
    final id = lUserId;
    await getStampsFromAPI(id!);
  }

  Future<bool> doQRScan(String url) async {
    setIsLoading = true;
    final result = await qrScan(url);
    setIsLoading = false;
    return result;
  }

  // constructor
  StampProvider() {
    _stamps = null;
    dio = Dio();
    dataSource = StampDataSourceImplementation(dio: dio);
    repo = StampRepositoryImplementation(stampDataSource: dataSource);
    getStamp = GetStamp(repo);
    qrScan = QrScan(repo);

    refreshStamp();
    notifyListeners();
  }
}
