import 'package:flutter/material.dart';

class TabBarLaporan extends StatelessWidget {
  const TabBarLaporan({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: "pemasukan"),
                Tab(text: "pengeluaran"),
              ],
            ),

            const SizedBox(height: 10),

            Expanded(
              child: TabBarView(
                children: [

                  /* ----------------------------- tab Pemasukan ----------------------------- */
                  Column(
                    children: [
                      
                    ],
                  ),

                  /* ----------------------------- tab pengeluaran ---------------------------- */
                  const Column(
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
