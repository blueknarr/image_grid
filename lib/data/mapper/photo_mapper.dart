import '../dto/photo_dto.dart';
import '../model/photo.dart';

extension ToPhoto on PhotoDto {
  Photo toPhoto() {
    return Photo(
      albumId: albumId,
      id: id,
      url: url,
      thumbnailUrl: thumbnailUrl,
    );
  }
}
