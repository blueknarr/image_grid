import '../dto/album_dto.dart';
import '../model/album.dart';

extension ToAlbum on AlbumDto {
  Album toAlbum() {
    return Album(
      userId: userId,
      id: id,
      title: title,
    );
  }
}
