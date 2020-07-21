import 'package:flutter/material.dart';

class RecentActivityContainer extends StatelessWidget {
  final _controller = PageController(viewportFraction: 0.6);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: PageView.builder(
        controller: _controller,
        itemCount: 10,
        itemBuilder: (context, index) {
          TextTheme textTheme = Theme.of(context).textTheme;

          Color colorBg = index % 2 == 0 ? Colors.white : Colors.grey[800];

          bool fontShouldBeDark = colorBg.computeLuminance() > 0.5;

          Color fontColor = fontShouldBeDark ? Colors.black : Colors.white;

          TextStyle itemTitle = textTheme.headline6.copyWith(
            color: fontColor,
            fontWeight: FontWeight.bold,
          );

          TextStyle itemDescription = textTheme.bodyText1.copyWith(
            color: fontColor,
            fontWeight: FontWeight.w300,
          );

          return Container(
            width: 50,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: colorBg,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Title Test test hjf dlj aslkdfjals'.toUpperCase(),
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: itemTitle,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '',
                  overflow: TextOverflow.fade,
                  maxLines: 6,
                  style: itemDescription,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
