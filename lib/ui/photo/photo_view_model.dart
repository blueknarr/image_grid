import 'package:image_grid/data/repository/photo_repository_impl.dart';

class PhotoViewModel {
  static int albumId = 0;

  final getPhotos = PhotoRepositoryImpl();
}
