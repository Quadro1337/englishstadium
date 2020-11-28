import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Stats extends StatelessWidget {
  _icon(ic, text) {
    return Container(
      child: Row(
        children: [
          Container(
            child: SizedBox(
              child: ic,
              width: 28,
              height: 28,
            ),
            margin: EdgeInsets.all(5),
          ),
          Container(margin: EdgeInsets.all(5), child: Text(text))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.0,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0x40000000),
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _icon(SvgPicture.asset('assets/svg/Medal.svg'), '1038'),
          _icon(SvgPicture.asset('assets/svg/Coins.svg'), '317'),
          _icon(SvgPicture.asset('assets/svg/Heart.svg'), '3')
        ],
      ),
    );
  }
}
