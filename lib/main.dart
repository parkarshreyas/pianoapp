import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(PianoApp());
}

class PianoApp extends StatelessWidget {
  static AudioCache player = AudioCache();
  void playAudio({String fileName}) {
    player.play(fileName);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            PianoButton(
              onKeyPress: () {
                playAudio(fileName: 'piano_notes/B3.wav');
              },
            ),
            PianoButtonWithSuperKey(
              onMainKeyPress: () {
                playAudio(fileName: 'piano_notes/A3.wav');
              },
              onSuperKeyPress: () {
                playAudio(fileName: 'piano_notes/Bb3.wav');
              },
            ),
            PianoButtonWithSuperKey(
              onMainKeyPress: () {
                playAudio(fileName: 'piano_notes/G2.wav');
              },
              onSuperKeyPress: () {
                playAudio(fileName: 'piano_notes/Ab3.wav');
              },
            ),
            PianoButtonWithSuperKey(
              onMainKeyPress: () {
                playAudio(fileName: 'piano_notes/F2.wav');
              },
              onSuperKeyPress: () {
                playAudio(fileName: 'piano_notes/Gb2.wav');
              },
            ),
            PianoButton(
              onKeyPress: () {
                playAudio(fileName: 'piano_notes/E2.wav');
              },
            ),
            PianoButtonWithSuperKey(
              onMainKeyPress: () {
                playAudio(fileName: 'piano_notes/D2.wav');
              },
              onSuperKeyPress: () {
                playAudio(fileName: 'piano_notes/Eb2.wav');
              },
            ),
            PianoButtonWithSuperKey(
              onMainKeyPress: () {
                playAudio(fileName: 'piano_notes/C2.wav');
              },
              onSuperKeyPress: () {
                playAudio(fileName: 'piano_notes/Db2.wav');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PianoButtonWithSuperKey extends StatelessWidget {
  final Function onMainKeyPress;
  final Function onSuperKeyPress;
  const PianoButtonWithSuperKey(
      {Key key, @required this.onMainKeyPress, @required this.onSuperKeyPress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 2.0, top: 2.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: RaisedButton(
                onPressed: onMainKeyPress,
              ),
            ),
          ),
          Positioned(
            top: -25.0,
            child: Container(
              width: 250.0,
              height: 50.0,
              child: RaisedButton(
                color: Colors.black,
                onPressed: onSuperKeyPress,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PianoButton extends StatelessWidget {
  final Function onKeyPress;
  const PianoButton({Key key, @required this.onKeyPress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, bottom: 2.0, top: 2.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: RaisedButton(
            onPressed: onKeyPress,
          ),
        ),
      ),
    );
  }
}
