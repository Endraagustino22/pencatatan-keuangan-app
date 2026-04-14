import 'package:flutter/material.dart';
import 'package:pencatatan_keuangan_app/model/transaksi.dart';
import 'package:pencatatan_keuangan_app/screen/dashboard/widgets/jumlah_saldo.dart';
import 'package:pencatatan_keuangan_app/screen/laporan/widgets/tab_view.dart';
import 'package:pencatatan_keuangan_app/screen/laporan/widgets/transaksi_list.dart';

class LaporanScreenWidget extends StatefulWidget {
  const LaporanScreenWidget({super.key});

  @override
  State<LaporanScreenWidget> createState() => _LaporanScreenWidgetState();
}

class _LaporanScreenWidgetState extends State<LaporanScreenWidget> {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
          const SaldoSummaryWidget(),
          const SizedBox(height: 10),
          const TabBarLaporan(),
      ],
    );
  }
}