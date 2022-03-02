import 'package:flutter/material.dart';
import 'package:rest_countries_app/const.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(74),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: AppBar(
            title: Text('Where in the world ?',
                style: Theme.of(context).textTheme.bodyLarge),
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
      body: const HomePageView(),
    );
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "hello there",
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),
      ),
    );
  }
}
