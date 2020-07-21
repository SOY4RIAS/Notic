import 'package:client_commerce/pages/editor/editor_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:client_commerce/widgets/section_header.dart';
import 'package:client_commerce/pages/preferences/preferences_page.dart';
import 'package:client_commerce/pages/home/containers/groups_container.dart';
import 'package:client_commerce/pages/home/containers/recent_activity_container.dart';

class HomePage extends StatelessWidget {
  static String routePath = '/';

  Widget buildBody(BuildContext context) {
    ThemeData theme = Theme.of(context);

    TextTheme textTheme = theme.textTheme;

    Size size = MediaQuery.of(context).size;

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          actions: <Widget>[buildAvatar(context)],
          expandedHeight: 130,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.all(10),
            centerTitle: false,
            title: Text(
              'Hola, Santiago',
              style: textTheme.headline5,
            ),
          ),
          floating: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: SectionHeader(
                  title: 'Esta es tu actividad reciente',
                ),
              ),
              Container(
                height: 300,
                child: RecentActivityContainer(),
              ),
              buildListSection(textTheme, theme, size)
            ],
          ),
        ),
      ],
    );
  }

  Widget buildListSection(TextTheme textTheme, ThemeData theme, Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SectionHeader(title: 'Listas'),
          GroupsContainer(),
        ],
      ),
    );
  }

  Widget buildAvatar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        onTap: () {
          Get.toNamed(PreferencesPage.routePath);
        },
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
              foregroundColor: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(EditorPage.routePath),
        child: Icon(Icons.edit),
      ),
    );
  }
}
