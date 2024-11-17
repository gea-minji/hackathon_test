import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/image_input_provider.dart';

class ImageInputScreen extends ConsumerWidget {
  const ImageInputScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageState = ref.watch(imageInputProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Hackathon Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: ElevatedButton(
                onPressed: () {
                  ref.read(imageInputProvider.notifier).loadGalleryImage();
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.black),
                ),
                child: const Text(
                  'OPEN GALLERY',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
          ),
          if (imageState?.path != null)
            Image.file(
              File(imageState!.path),
              width: 100,
              height: 100,
            ),
          if (imageState?.path != null)
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.black),
                  ),
                  child: const Text(
                    'SEND IMAGE',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            ),
        ],
      ),
    );
  }
}
