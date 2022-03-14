import 'package:flutter/material.dart';

class MapRow extends StatelessWidget {
  const MapRow({Key? key, required this.map, required this.rkey})
      : super(key: key);
  final String rkey;
  final Map<String, dynamic> map;
  @override
  Widget build(BuildContext context) {
    List<String> keylist = map.keys.toList();
    List<Text> reqWidgets = [];
    for (var i in keylist) {
      if (keylist.indexOf(i) == 0) {
        reqWidgets.add(Text(
          i,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16),
        ));
      } else {
        reqWidgets.add(Text(
          ',' + i,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16),
        ));
      }
    }

    return Row(
      children: [
        Text(
          '$rkey: ',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
        ),
        const SizedBox(
          width: 4,
        ),
        ...reqWidgets
      ],
    );
  }
}
