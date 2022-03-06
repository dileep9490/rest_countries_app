import 'package:flutter/material.dart';

import '../../const.dart';

class CountryFullInfoScreen extends StatelessWidget {
  const CountryFullInfoScreen({
    Key? key,
  }) : super(key: key);
  static const String route = 'CountryFullInfoScreen';

//TODO: get the id from args
//TODO: call the init fucntion and get the data from this id and then display
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(74),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: AppBar(
              automaticallyImplyLeading: false,
              title: Text('Where in the world ?',
                  style: Theme.of(context).textTheme.bodyLarge),
              shadowColor: veryLightGray,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: GestureDetector(
                    onTap: () {
                      //TODO:implement dark mode
                    },
                    child: Row(children: [
                      const Icon(
                        Icons.dark_mode_outlined,
                        color: veryDarkBlue2,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Dark Mode',
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: CountryFullInfoView(
          id: args,
        ));
  }
}

class CountryFullInfoView extends StatelessWidget {
  const CountryFullInfoView({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(id),
    );
  }
}
