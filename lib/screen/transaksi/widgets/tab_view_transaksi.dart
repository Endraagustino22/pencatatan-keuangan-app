import 'package:flutter/material.dart';
import 'package:pencatatan_keuangan_app/screen/transaksi/widgets/input_pemasukan.dart';
import 'package:pencatatan_keuangan_app/screen/transaksi/widgets/input_pengeluaran.dart';

class TabBarTransaksi extends StatelessWidget {
  const TabBarTransaksi({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: "pengeluaran"),
                Tab(text: "pemasukan"),
              ],
            ),

            const SizedBox(height: 10),

            Expanded(
              child: TabBarView(
                children: [

                  /* ----------------------------- tab Pemasukan ----------------------------- */
                  Column(
                    children: [
                      const InputPengeluaranWidget()
                    ],
                  ),

                  /* ----------------------------- tab pengeluaran ---------------------------- */
                  const Column(
                    children: [
                      InputPemasukanWidget()
                    ],
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
