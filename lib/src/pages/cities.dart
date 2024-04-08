import 'package:devstravel/src/models/appdata.dart';
import 'package:devstravel/src/pages/citybox.dart';
import 'package:devstravel/src/partials/customappbar.dart';
import 'package:devstravel/src/partials/customdrawer.dart';
import 'package:devstravel/src/partials/customscarffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cities extends StatelessWidget {
  const Cities({super.key});

  cityBoxAction(context, index) {
    print(index['name']);
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final continentIndex = ModalRoute.of(context)!.settings.arguments;

    return Consumer<AppData>(builder: (context, AppData appdata, child) {
      var cities = [];

      for (var el in appdata.data[int.parse(continentIndex.toString())]
          ['countries']) {
        cities.addAll(el['cities']);
      }

      return CustomScaffold(
        scaffoldKey: _scaffoldKey,
        customAppBar: CustomAppBar(
                context: context,
                scaffoldKey: _scaffoldKey,
                text: appdata.data[int.parse(continentIndex.toString())]
                    ['name'],
                search: true,
                drawer: false)
            .getAppBar(),
        customDrawer: CustomDrawer(),
        body: GridView.count(
          crossAxisCount: 3,
          children: List.generate(
            cities.length,
            (index) {
              return CityBox(data: cities[index], onTap: cityBoxAction);
            },
          ),
        ),
      );
    });
  }
}
