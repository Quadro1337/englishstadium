import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechScreen extends StatefulWidget {
  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  // final Map<String, HighlightedWord> _highlights = {
  //   'flutter': HighlightedWord(
  //     onTap: () => print('flutter'),
  //     textStyle: const TextStyle(
  //       color: Colors.blue,
  //       fontWeight: FontWeight.bold,
  //     ),
  //   ),
  //   'voice': HighlightedWord(
  //     onTap: () => print('voice'),
  //     textStyle: const TextStyle(
  //       color: Colors.green,
  //       fontWeight: FontWeight.bold,
  //     ),
  //   ),
  //   'subscribe': HighlightedWord(
  //     onTap: () => print('subscribe'),
  //     textStyle: const TextStyle(
  //       color: Colors.red,
  //       fontWeight: FontWeight.bold,
  //     ),
  //   ),
  //   'like': HighlightedWord(
  //     onTap: () => print('like'),
  //     textStyle: const TextStyle(
  //       color: Colors.blueAccent,
  //       fontWeight: FontWeight.bold,
  //     ),
  //   ),
  //   'comment': HighlightedWord(
  //     onTap: () => print('comment'),
  //     textStyle: const TextStyle(
  //       color: Colors.green,
  //       fontWeight: FontWeight.bold,
  //     ),
  //   ),
  // };

  stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = '...';
  double _confidence = 1.0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            _text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Text('Произнесите это предложение: ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Color(0x40000000))),
                SizedBox(
                  height: 10,
                ),
                Text('One can become a writer only if he is talented.',
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 24))
              ],
            ),
          ),
          FlatButton(
              height: 150,
              child: Icon(
                _isListening ? Icons.mic : Icons.mic_off,
                size: 60,
                color: Colors.white,
              ),
              onPressed: _listen,
              color: Color(0xFF3FA8E3),
              shape: CircleBorder())
        ],
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
}
