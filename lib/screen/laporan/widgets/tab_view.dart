import 'package:flutter/material.dart';
import 'package:pencatatan_keuangan_app/model/transaksi.dart';
import 'package:pencatatan_keuangan_app/screen/laporan/widgets/chart_pengeluaran.dart';
import 'package:pencatatan_keuangan_app/screen/laporan/widgets/transaksi_list.dart';

class TabBarLaporan extends StatelessWidget {
  const TabBarLaporan({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TransactionModel> transactions = [
      TransactionModel(
        type: "Masuk",
        category: "Gaji",
        amount: 5000000,
        date: DateTime.now(),
      ),
      TransactionModel(
        type: "Keluar",
        category: "Makan",
        amount: 50000,
        date: DateTime.now(),
      ),
    ];

    return Expanded(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: "Harian"),
                Tab(text: "Bulanan"),
              ],
            ),

            const SizedBox(height: 10),

            Expanded(
              child: TabBarView(
                children: [
                  /// TAB HARIAN
                  Column(
                    children: [
                      const ChartPengeluaran(
                        budget: 1000000,
                        used: 750000,
                      ),
                      const SizedBox(height: 10),

                      Expanded(
                        child: TransaksiListWidget(
                          transactions: transactions,
                        ),
                      ),
                    ],
                  ),

                  /// TAB BULANAN
                  const Column(
                    children: [
                      ChartPengeluaran(
                        budget: 1000000,
                        used: 500000,
                      ),
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