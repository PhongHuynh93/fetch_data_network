import 'package:fetch_data_network/data/Repository.dart';
import 'package:fetch_data_network/data/model/Art.dart';
import 'package:fetch_data_network/data/model/DeviantArtList.dart';
import 'package:fetch_data_network/domain/UseCase.dart';

class GetPopularArtParam {}
class GetPopularArtUseCase extends UseCase<GetPopularArtParam,
DeviantArtList<Art>> {
  final Repository _repository = Repository();

  @override
  Future<DeviantArtList<Art>> execute(GetPopularArtParam param) {
    return _repository.getPopularArt();
  }
}