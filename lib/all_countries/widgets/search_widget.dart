import 'package:flutter/material.dart';

import '../../const.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: SizedBox(
      height: 60,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        const Icon(
          Icons.search,
          color: darkGray,
        ),
        SizedBox(
          width: 300,
          child: TextFormField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'Search for a Country',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: darkGray, fontSize: 16))),
        )
      ]),
    ));
  }
}
