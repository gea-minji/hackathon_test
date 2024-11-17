import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_sample/providers/text_input_provider.dart';

class TextInputScreen extends ConsumerWidget {
  TextInputScreen({super.key});

  final inputController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultState = ref.watch(asyncChatProvider);

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
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextField(
              controller: inputController,
              decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.black54),
                  hintText:
                      'Please write down your refrigerator storage conditions'),
              onChanged: null,
            ),
          ),
          Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: ElevatedButton(
                  onPressed: () {
                    ref
                        .read(asyncChatProvider.notifier)
                        .postUserPrompt(inputController.text);
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.black),
                  ),
                  child: const Text(
                    'SEND',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ))),
          resultState.when(
              data: (message) => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(message ?? 'No response from AI'),
                  ),
              error: (error, stack) => Text('Error: $error'),
              loading: () => const CircularProgressIndicator())
        ],
      ),
    );
  }
}
