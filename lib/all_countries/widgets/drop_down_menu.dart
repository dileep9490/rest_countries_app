import 'package:flutter/material.dart';

class DropDownMenu extends StatelessWidget {
  const DropDownMenu({
    Key? key,
  }) : super(key: key);

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(child: Text("USA"), value: "1"),
      DropdownMenuItem(child: Text("Canada"), value: "2"),
      DropdownMenuItem(child: Text("Brazil"), value: "3"),
      DropdownMenuItem(child: Text("England"), value: "4"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    String selectedvalue = '1';
    return Container(
      alignment: Alignment.centerLeft,
      child: DropdownButton(
        items: dropdownItems,
        onChanged: (String? value) {
          //TODO: work with this later
          selectedvalue = value as String;
        },
        value: selectedvalue,
      ),
    );
  }
}
