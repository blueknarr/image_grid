import 'package:image_grid/data/mapper/album_mapper.dart';

import '../api/album_api_impl.dart';
import '../dto/album_dto.dart';
import '../model/album.dart';
import 'album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  @override
  Future<List<Album>> getAlbums() async {
    final api = AlbumApiImpl();
    final List<AlbumDto> dto = await api.getAlbums();
    final albums = dto.map((e) => e.toAlbum()).toList();
    return albums;
  }
}
