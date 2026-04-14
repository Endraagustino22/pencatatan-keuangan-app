import 'package:flutter/material.dart';
import 'package:pencatatan_keuangan_app/screen/laporan/widgets/chart_pengeluaran.dart';

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
                Tab(text: "Harian"),
                Tab(text: "Bulanan"),
              ],
            ),
            SizedBox(
              height: 250,
              width: 250,
              child: TabBarView(
                children: <Widget>[
                  Center(
                    child: ChartPengeluaran(budget: 1000000, used: 750000),
                  ),
                  Center(
                    child: ChartPengeluaran(budget: 1000000, used: 500000),
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
