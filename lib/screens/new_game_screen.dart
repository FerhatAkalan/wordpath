// screens/new_game_screen.dart

import 'package:flutter/material.dart';

class NewGameScreen extends StatelessWidget {
  const NewGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yeni Oyun Başlat'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Yeni oyun başlatma işlemleri buraya eklenecek
          },
          child: const Text('Yeni Oyun Başlat'),
        ),
      ),
    );
  }
}
