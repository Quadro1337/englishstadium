import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final void Function() callback;
  final String label;
  const RoundButton({Key key, this.callback, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FlatButton(
            //color: Color(0xFF3FA8E3),
            height: 100,
            shape: CircleBorder(),
            child: Image.asset('assets/png/' + label + '.png'),
            onPressed: callback,
          ),
          Text(
            label,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
