import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_grid/ui/main/main_view_model.dart';

import '../../data/model/album.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _albums = MainViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('앨범/사진 앱'),
        ),
        body: Column(
          children: [
            FutureBuilder<List<Album>>(
              future: _albums.getAlbums,
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

                final albums = snapshot.data!;

                return Expanded(
                  child: ListView.builder(
                      itemCount: albums.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           (PhotoScreen(id: albums[index].id))),
                              // );
                              context.push('/main/photo',
                                  extra: albums[index].id);
                            },
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text('id: ${albums[index].id}'),
                                    const SizedBox(width: 8),
                                    Text('userId: ${albums[index].userId}'),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        'title: ${albums[index].title}',
                                        //softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                );
              },
            ),
          ],
        ));
  }
}
