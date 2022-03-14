import 'package:flutter/material.dart';

class KeyValueRow extends StatelessWidget {
  const KeyValueRow({Key? key, required this.rkey, required this.value})
      : super(key: key);
  final String rkey;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          rkey + ': ',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16),
        )
      ],
    );
  }
}
