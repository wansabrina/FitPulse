import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ActivityCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String unit;
  final String chartType;
  final Widget navigateTo;

  const ActivityCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.unit,
    required this.chartType,
    required this.navigateTo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => navigateTo),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width * 0.435,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 0),
              blurRadius: 2,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 18, color: Colors.blueAccent),
                const SizedBox(width: 6),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            chartType == "bar"
                ? SizedBox(
              height: 60,
              child: BarChart(
                BarChartData(
                  barGroups: showingBarGroups(),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  titlesData: const FlTitlesData(
                    show: false,
                  ),
                  gridData: const FlGridData(show: false),
                  barTouchData: BarTouchData(enabled: false),
                ),
              ),
            )
                : SizedBox(
              height: 60,
              child: LineChart(
                LineChartData(
                  lineTouchData: const LineTouchData(enabled: false),
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(
                    show: false,
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(0, 1),
                        const FlSpot(1, 1.5),
                        const FlSpot(2, 1.4),
                        const FlSpot(3, 3.4),
                        const FlSpot(4, 2),
                        const FlSpot(5, 2.2),
                        const FlSpot(6, 1.8),
                      ],
                      isCurved: true,
                      barWidth: 2,
                      color: Colors.blueAccent,
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.blueAccent.withOpacity(0.2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
          
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  unit,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  List<BarChartGroupData> showingBarGroups() {
    return List.generate(7, (i) {
      return BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: (i % 2 == 0 ? 3 : 6).toDouble(),
            color: Colors.blueAccent,
            width: 8,
          ),
        ],
      );
    });
  }
}
