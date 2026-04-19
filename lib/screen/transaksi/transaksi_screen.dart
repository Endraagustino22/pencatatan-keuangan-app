import 'package:flutter/material.dart';
import 'package:pencatatan_keuangan_app/screen/dashboard/widgets/jumlah_saldo.dart';

class TransaksiScreenWidget extends StatefulWidget {
  const TransaksiScreenWidget({super.key});

  @override
  State<TransaksiScreenWidget> createState() => _TransaksiScreenWidgetState();
}

class _TransaksiScreenWidgetState extends State<TransaksiScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SaldoSummaryWidget(),
        
      ],
    );
  }
}