import 'package:fetch_data_network/data/Repository.dart';
import 'package:fetch_data_network/data/model/Photo.dart';
import 'package:fetch_data_network/domain/UseCase.dart';
import 'package:flutter/foundation.dart';

import '../data/Repository.dart';

class GetPhotoListParam {}
class GetPhotoListUseCase extends UseCase<GetPhotoListParam, List<Photo>> {
  final Repository _repository = Repository();

  GetPhotoListUseCase();

  @override
  Future<List<Photo>> execute(GetPhotoListParam param) {
    return _repository.fetchPhotos();
  }
}


