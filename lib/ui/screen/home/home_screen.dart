import 'package:flutter/material.dart';
import 'package:travel_app/ui/screen/home/page/profile_page.dart';
import 'package:travel_app/ui/screen/home/page/trips_page.dart';
import 'package:travel_app/ui/component/appbar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;
  late List<Widget> _pages;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    _pages = <Widget>[
      Center(
        child: Column(
          children: [
            Text(
              'Актуальні пропозиції',
              textAlign: TextAlign.center,
            ),
            Text(
              'Кіпр',
              textAlign: TextAlign.center,
            ),
            Text(
              'Берлін',
              textAlign: TextAlign.center,
            ),
            Text(
              'Таллін',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      TripsPage(),
      ProfilePage(),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: buildAppBar(context),
      body: IndexedStack(
        children: _pages,
        index: _selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.restore_from_trash),
            label: 'Головна',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trip_origin),
            label: 'Подорожі',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профіль',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
