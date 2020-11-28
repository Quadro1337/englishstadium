import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final void Function() callback;
  final String picture;
  final String label;
  const RoundButton({Key key, this.callback, this.label, this.picture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FlatButton(
            //color: Color(0xFF3FA8E3),
            height: 100,
            shape: CircleBorder(),
            child: Image.asset('assets/png/' + picture + '.png'),
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
