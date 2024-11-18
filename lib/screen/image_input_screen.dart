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
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: ElevatedButton(
                        onPressed: () {
                          ref
                              .read(imageInputProvider.notifier)
                              .loadGalleryImage();
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.black),
                        ),
                        child: const Text(
                          'OPEN GALLERY',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                  )),
                  if (imageState.image?.path != null)
                    Expanded(
                        child: Image.file(
                      File(imageState.image!.path),
                    )),
                  if (imageState.image?.path != null)
                    Flexible(
                        child: Container(
                      width: double.infinity,
                      height: 50,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: ElevatedButton(
                          onPressed: () {
                            ref.read(imageInputProvider.notifier).postImage();
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(Colors.black),
                          ),
                          child: const Text(
                            'SEND IMAGE',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    )),
                ],
              )),
          Flexible(
              flex: 3,
              child: imageState.resultText.when(
                data: (resultText) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child:
                      Center(child: Text(resultText ?? 'No response from AI')),
                ),
                error: (error, stackTrace) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error: $error'),
                  ],
                ),
                loading: () => const Center(
                    child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator())),
              ))
        ],
      ),
    );
  }
}
