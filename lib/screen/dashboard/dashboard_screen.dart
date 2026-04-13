import 'package:flutter/material.dart';
import 'package:pencatatan_keuangan_app/screen/app_bar.dart';
import 'package:pencatatan_keuangan_app/screen/dashboard/widget/jumlah_saldo.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Dashboard'),
      body: Column(
        children: [
          const SaldoSummaryWidget()
        ],
      ),
    );
  }
}