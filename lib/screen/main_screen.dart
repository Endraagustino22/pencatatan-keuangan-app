import 'package:flutter/material.dart';
import 'package:pencatatan_keuangan_app/screen/laporan/laporan_screen.dart';
import 'package:pencatatan_keuangan_app/screen/transaksi/transaksi_screen.dart';

class MainScreen extends StatefulWidget {
  final Widget dashboardScreen;

  const MainScreen({
    super.key,
    required this.dashboardScreen,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      widget.dashboardScreen,
      const TransaksiScreen(),
      const LaporanScreen(),
      const BudgetingScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1AD8A0),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(fontSize: 11),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz_outlined),
            activeIcon: Icon(Icons.swap_horiz_rounded),
            label: 'Transaksi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            activeIcon: Icon(Icons.bar_chart_rounded),
            label: 'Laporan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            activeIcon: Icon(Icons.account_balance_wallet_rounded),
            label: 'Budgeting',
          ),
        ],
      ),
    );
  }
}

/* ---------------------------- transkasi screen ---------------------------- */
// placeholder screens
class TransaksiScreen extends StatelessWidget {
  const TransaksiScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: TransaksiScreenWidget());
}

/* ---------------------------- laporan screen ---------------------------- */
class LaporanScreen extends StatelessWidget {
  const LaporanScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: LaporanScreenWidget());
}

/* ---------------------------- budgeting screen ---------------------------- */
class BudgetingScreen extends StatelessWidget {
  const BudgetingScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Budgeting'));
}