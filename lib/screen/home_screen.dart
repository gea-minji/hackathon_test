import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: ElevatedButton.icon(
                onPressed: () => context.goNamed('imageInputScreen'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                icon: const Icon(Icons.camera_alt, color: Colors.white),
                label: const Text('CAMERA',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold))),
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: ElevatedButton.icon(
                onPressed: () => context.goNamed('textInputScreen'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                icon: const Icon(Icons.text_fields, color: Colors.white),
                label: const Text('TEXT',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold))),
          ),
        ],
      ),
    );
  }
}
