import 'package:devstravel/src/common/fonts.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0.0),
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'DevsTravel',
                  style: FontesApp.textHeadDrawer,
                ),
                Text(
                  'versão 1.0',
                  style: FontesApp.textVersionDrawer,
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.public),
            title: const Text('Escolher Continente'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/continente');
            },
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Buscar Cidade'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/search');
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Cidades Salvas'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/favorites');
            },
          ),
        ],
      ),
    );
  }
}
