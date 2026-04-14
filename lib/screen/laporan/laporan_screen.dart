import 'package:flutter/material.dart';
import 'package:pencatatan_keuangan_app/screen/dashboard/widgets/jumlah_saldo.dart';

class LaporanScreenWidget extends StatefulWidget {
  const LaporanScreenWidget({super.key});

  @override
  State<LaporanScreenWidget> createState() => _LaporanScreenWidgetState();
}

class _LaporanScreenWidgetState extends State<LaporanScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
          SaldoSummaryWidget(),
          SizedBox(height: 10),
      ],
    );
  }
}