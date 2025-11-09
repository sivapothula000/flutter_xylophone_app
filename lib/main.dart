import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playsound(int soundNumber) {
    final player = AudioPlayer();
    player.play(AssetSource('note$soundNumber.wav'));
  }

  Widget buildKey({
    required Color color,
    required int soundNumber,
    required String note,
  }) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        onPressed: () async {
          playsound(soundNumber);
          HapticFeedback.lightImpact(); // vibration feedback
        },
        child: Text(
          note,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My XyloTunes',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My XyloTunes 🎵',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.grey],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildKey(color: Colors.red, soundNumber: 1, note: 'Sa'),
                buildKey(color: Colors.orange, soundNumber: 2, note: 'Re'),
                buildKey(color: Colors.yellow, soundNumber: 3, note: 'Ga'),
                buildKey(color: Colors.green, soundNumber: 4, note: 'Ma'),
                buildKey(color: Colors.teal, soundNumber: 5, note: 'Pa'),
                buildKey(color: Colors.blue, soundNumber: 6, note: 'Da'),
                buildKey(color: Colors.purple, soundNumber: 7, note: 'Ni'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
