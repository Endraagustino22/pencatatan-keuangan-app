import 'package:flutter/material.dart';
import 'package:pencatatan_keuangan_app/screen/app_bar.dart';

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
      body: const Center(
        child: Text('Welcome to the Dashboard!'),
      ),
    );
  }
}