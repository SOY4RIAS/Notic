import 'package:flutter/material.dart';

class GroupsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            'Ejemplo $index'.toUpperCase(),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: Colors.grey,
      ),
    );
  }
}
