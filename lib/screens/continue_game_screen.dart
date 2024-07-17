// screens/continue_game_screen.dart

import 'package:flutter/material.dart';

class ContinueGameScreen extends StatelessWidget {
  final String? lastGame; // Son oyun durumu değişkeni

  const ContinueGameScreen({Key? key, this.lastGame}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eski Oyuna Devam Et'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            if (lastGame != null) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Eski Oyuna Devam Et'),
                    content: Text(lastGame!),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Kapat'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Kayıtlı bir eski oyun bulunamadı.'),
                ),
              );
            }
          },
          child: const Text('Eski Oyuna Devam Et'),
        ),
      ),
    );
  }
}
