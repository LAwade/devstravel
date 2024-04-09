import 'package:devstravel/src/common/fonts.dart';
import 'package:devstravel/src/models/appdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CityPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final city =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Consumer<AppData>(
      builder: (context, AppData appdata, child) => Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 250,
              child: Image.network(
                city['places'][0]['img'],
                fit: BoxFit.cover,
              ),
            ),
            ListView(
              padding: EdgeInsets.zero,
              physics: const ClampingScrollPhysics(),
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 220),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Text(
                                    city['name'],
                                    style: FontesApp.textMedium,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.blue,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.blue,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.blue,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.blue,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.blue,
                                      ),
                                      Text('4,2')
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 50,
              width: 50,
              margin: EdgeInsets.only(top: statusBarHeight, left: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                color: Colors.white10,
              ),
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
