import '../../data/repository/album_repository_impl.dart';

class MainViewModel {
  final getAlbums = AlbumRepositoryImpl().getAlbums();
}
