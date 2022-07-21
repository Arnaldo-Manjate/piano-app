import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playAudio(String filepath) {
    final audioPlayer = AudioCache();
    audioPlayer.play(filepath);
  }

  List<Expanded> createAudioButtons() {
    List<String> colors = [
      'red',
      'orange',
      'yellow',
      'green',
      'teal',
      'blue',
      'purple'
    ];
    List<Expanded> buttons = [];

    for (var i = 0; i < colors.length; i++) {
      int fileNumber = i + 1;
      buttons.add(
        createAudioButton(
          filepath: 'note$fileNumber.wav',
          note: colors[i],
          color: colors[i],
        ),
      );
    }

    return buttons;
  }

  Widget createAudioButton({String filepath, String note, String color}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: mapMaterialColors(color), // Background Color
        ),
        onPressed: () => playAudio(filepath),
        child: Text(note),
      ),
    );
  }

  dynamic mapMaterialColors(String color) {
    switch (color) {
      case 'red':
        {
          return Colors.red;
        }
      case 'orange':
        {
          return Colors.orange;
        }
      case 'yellow':
        {
          return Colors.yellow;
        }
      case 'green':
        {
          return Colors.green;
        }
      case 'teal':
        {
          return Colors.teal;
        }
      case 'blue':
        {
          return Colors.blue;
        }
      case 'purple':
        {
          return Colors.purple;
        }
      default:
        {
          return Colors.blue;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: createAudioButtons(),
            ),
          ),
        ),
      ),
    );
  }
}
