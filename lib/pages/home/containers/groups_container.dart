import 'package:client_commerce/modules/notes/notes.controller.dart';
import 'package:client_commerce/modules/notes/notes.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sembast/sembast.dart';

class GroupsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NotesController>();
    return StreamBuilder<List<NoteModel>>(
      stream: controller.getNotes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        final data = snapshot.data;

        return ListView.separated(
          primary: false,
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(data[index].title),
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(
            color: Colors.grey,
          ),
        );
      },
    );
  }
}
