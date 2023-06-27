import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_grid/ui/photo/photo_view_model.dart';

import '../../data/model/photo.dart';

class PhotoScreen extends StatelessWidget {
  final int id;
  PhotoScreen({Key? key, required this.id}) : super(key: key);

  //final Album album;
  final _photos = PhotoViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('앨범 사진'),
        ),
        body: Column(
          children: [
            FutureBuilder<List<Photo>>(
              future: _photos.getPhotos.getPhotos(id),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Error 발생');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text(
                    '로딩 중',
                    style: Theme.of(context).textTheme.displayMedium,
                  );
                }

                final photos = snapshot.data!;

                return Expanded(
                  child: GridView.builder(
                    itemCount: photos.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final url = photos[index].thumbnailUrl;
                      return GestureDetector(
                        onTap: () {
                          context.push('/main/photo/detail',
                              extra: photos[index]);
                        },
                        child: Hero(
                          tag: photos[index].id,
                          child: Image.network(
                            url,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ));
  }
}
