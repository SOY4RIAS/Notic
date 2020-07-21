import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  SectionHeader({@required this.title});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: textTheme.headline6,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: theme.accentColor,
            borderRadius: BorderRadius.all(
              const Radius.circular(6),
            ),
          ),
          height: 5,
          width: size.width * 0.2,
        ),
      ],
    );
  }
}
