import 'package:image_grid/data/dto/photo_dto.dart';
import 'package:image_grid/data/mapper/photo_mapper.dart';
import 'package:image_grid/data/model/photo.dart';
import 'package:image_grid/data/repository/photo_repository.dart';

import '../api/photo_api_impl.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    final api = PhotoApiImpl();

    final List<PhotoDto> dto = await api.getPhotos(albumId);
    final photos = dto.map((e) => e.toPhoto()).toList();
    return photos;
  }
}
