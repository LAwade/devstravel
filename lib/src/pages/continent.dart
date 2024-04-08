import 'package:devstravel/src/common/fonts.dart';
import 'package:devstravel/src/models/appdata.dart';
import 'package:devstravel/src/pages/citybox.dart';
import 'package:devstravel/src/partials/customappbar.dart';
import 'package:devstravel/src/partials/customdrawer.dart';
import 'package:devstravel/src/partials/customscarffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContinentePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void seeCityAction(context, continentIndex) {
    Navigator.pushNamed(context, '/cities', arguments: continentIndex);
    print(continentIndex);
  }

  cityBoxAction(context, index) {
    print(index['name']);
    Navigator.pushNamed(context, '/cities');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, AppData appdata, child) => CustomScaffold(
        scaffoldKey: _scaffoldKey,
        customAppBar: CustomAppBar(
                context: context,
                scaffoldKey: _scaffoldKey,
                text: 'Escolha um Continente',
                search: true,
                drawer: true)
            .getAppBar(),
        customDrawer: CustomDrawer(),
        body: ListView.builder(
          itemCount: appdata.data.length,
          itemBuilder: (context, index) {
            var cities = [];
            for (var item in appdata.data[index]['countries']) {
              cities.addAll(item['cities']);
            }

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: Text(
                          "${appdata.data[index]['name']} (${cities.length})",
                          style: FontesApp.textSmall),
                    ),
                    TextButton(
                      onPressed: () {
                        seeCityAction(context, index);
                      },
                      child: Text(
                        'Ver cidades',
                        style: FontesApp.textXsmall,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cities.length,
                    itemBuilder: (context, index) {
                      return CityBox(data: cities[index], onTap: cityBoxAction);
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
