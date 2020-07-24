import 'package:client_commerce/modules/notes/notes.controller.dart';
import 'package:client_commerce/modules/notes/notes.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentActivityContainer extends StatelessWidget {
  final _controller = PageController(viewportFraction: 0.6);

  @override
  Widget build(BuildContext context) {
    NotesController notesController = Get.find();
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: StreamBuilder<List<NoteModel>>(
          stream: notesController.getNotes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            final data = snapshot.data;

            return PageView.builder(
              controller: _controller,
              itemCount: data.length,
              itemBuilder: (context, index) {
                TextTheme textTheme = Theme.of(context).textTheme;

                Color colorBg =
                    index % 2 == 0 ? Colors.white : Colors.grey[800];

                bool fontShouldBeDark = colorBg.computeLuminance() > 0.5;

                Color fontColor =
                    fontShouldBeDark ? Colors.black : Colors.white;

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
                        data[index].title.toUpperCase(),
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: itemTitle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        data[index].summary.toUpperCase(),
                        overflow: TextOverflow.fade,
                        maxLines: 6,
                        style: itemDescription,
                      ),
                    ],
                  ),
                );
              },
            );
          }),
    );
  }
}
