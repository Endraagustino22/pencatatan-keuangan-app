import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartPengeluaran extends StatelessWidget {
  final double budget;
  final double used;

  const ChartPengeluaran({super.key, required this.budget, required this.used});

  @override
  Widget build(BuildContext context) {
    final percentage = (used / budget * 100).clamp(0, 100).toDouble();

    return Center(
      child: SizedBox(
        width: 140,
        height: 140,
        child: Stack(
          alignment: Alignment.center,
          children: [
            PieChart(
              PieChartData(
                startDegreeOffset: -90,
                sectionsSpace: 0,
                centerSpaceRadius: 40,
                sections: _sections(percentage),
              ),
            ),

            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${percentage.toStringAsFixed(0)}%",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text("Terpakai", style: TextStyle(fontSize: 10)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> _sections(double percentage) {
    return [
      /// TERPAKAI
      PieChartSectionData(
        value: percentage,
        color: _getColor(percentage),
        radius: 18,
        showTitle: false,
      ),

      /// SISA
      PieChartSectionData(
        value: 100 - percentage,
        color: const Color(0xFFE5E7EB),
        radius: 18,
        showTitle: false,
      ),
    ];
  }

  /// warna berubah sesuai pemakaian
  Color _getColor(double percent) {
    if (percent < 50) {
      return Colors.green;
    } else if (percent < 80) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}
