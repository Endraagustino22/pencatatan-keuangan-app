import 'package:flutter/material.dart';
import 'package:pencatatan_keuangan_app/screen/dashboard/widgets/jumlah_saldo.dart';
import 'package:pencatatan_keuangan_app/screen/transaksi/widgets/input_pengeluaran.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SaldoSummaryWidget(),
          SizedBox(height: 10),
          Expanded(child: const InputPengeluaranWidget()),
        ],
      ),
    );
  }
}