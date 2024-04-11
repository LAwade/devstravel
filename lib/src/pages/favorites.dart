import 'package:devstravel/src/models/appdata.dart';
import 'package:devstravel/src/pages/citybox.dart';
import 'package:devstravel/src/partials/customappbar.dart';
import 'package:devstravel/src/partials/customdrawer.dart';
import 'package:devstravel/src/partials/customscarffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  cityBoxAction(context, data, index) {
    Navigator.pushNamed(context, '/city', arguments: data);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, AppData appdata, child) {
        List favorites = appdata.favoriteCities();
        return CustomScaffold(
          scaffoldKey: _scaffoldKey,
          customAppBar: CustomAppBar(
                  context: context,
                  scaffoldKey: _scaffoldKey,
                  text: 'Cidades Salvas',
                  search: true,
                  drawer: true)
              .getAppBar(),
          customDrawer: CustomDrawer(),
          body: ListView(
            children: [
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  favorites.length,
                  (index) {
                    return CityBox(
                      data: favorites[index],
                      onTap: cityBoxAction,
                      index: index,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
