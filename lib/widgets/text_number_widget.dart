import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextNumberWidget extends StatelessWidget {
  TextNumberWidget({Key? key, required this.number}) : super(key: key);

  int number;

  @override
  Widget build(BuildContext context) {
    String addCommas(int num) {
      var formatter = NumberFormat('###,###,000');
      return formatter.format(num);
    }

    return Text(
      addCommas(number),
      style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
    );
  }
}
