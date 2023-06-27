import '../dto/album_dto.dart';

abstract interface class AlbumApi {
  Future<List<AlbumDto>> getAlbums();
}
