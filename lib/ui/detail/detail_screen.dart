import 'package:flutter/material.dart';

import '../../data/model/photo.dart';

class DetailScreen extends StatelessWidget {
  final Photo photo;

  const DetailScreen({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Album Detail Info'),
      ),
      body: Column(
        children: [
          Hero(
            tag: photo.id,
            child: Image.network(photo.url),
          ),
          Text('ID: ${photo.id}'),
          Text('Album ID: ${photo.albumId}')
        ],
      ),
    );
  }
}
