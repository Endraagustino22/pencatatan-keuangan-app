import 'package:flutter/material.dart';

class TabBarLaporan extends StatelessWidget {
  const TabBarLaporan({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: <Widget>[
                Tab(text: "Harian",),
                Tab(text: "Bulanan",),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Center(child: Text("It's cloudy here")),
                  Center(child: Text("It's rainy here")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}