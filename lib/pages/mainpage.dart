import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_layouts/pages/rowcolumn.dart';
import 'package:flutter_layouts/pages/container.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBody() {
    if (_selectedIndex == 0) {
      return const RowColumnGrid(title: "Row / Column Layout");
    } else {
      return const ContainerLayout(title: "Container Layout");
    }
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.list),
          label: 'Row / Column',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.box),
          label: 'Container',
        )
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).colorScheme.onPrimary,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
