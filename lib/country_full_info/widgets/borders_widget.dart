import 'package:flutter/material.dart';

class Borders extends StatelessWidget {
  const Borders({Key? key, required this.borderslist}) : super(key: key);

  final List<String> borderslist;

  @override
  Widget build(BuildContext context) {
    List<String> keylist = borderslist;
    List<Widget> reqWidgets = [];
    for (var i in keylist) {
      reqWidgets.add(GestureDetector(
        onTap: (){
          //TODO:implemenet to go that border screen
        },
        child: SizedBox(
          height: 30,
          width: 50,
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: Center(
              child: Text(
                i,
                style:
                    Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16),
              ),
            ),
          ),
        ),
      ));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Border Countries",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: reqWidgets,
        ),
      ],
    );
  }
}
