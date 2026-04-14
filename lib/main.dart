import 'package:flutter/material.dart';
import 'package:pencatatan_keuangan_app/screen/main_screen.dart';
import 'screen/dashboard/dashboard_screen.dart';
import 'package:intl/date_symbol_data_local.dart'; // 


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFD97757)),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      home: const MainScreen( dashboardScreen: DashboardScreen()),
    );
  }
}
