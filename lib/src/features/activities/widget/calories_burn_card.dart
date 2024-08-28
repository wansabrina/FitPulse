import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CaloriesBurnedCard extends StatelessWidget {
  const CaloriesBurnedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
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
          const Text(
            "For 10.000 Steps, you burn:",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              Icon(Icons.local_fire_department, color: Colors.blue),
              SizedBox(width: 8),
              Text(
                '150', 
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 5),
              Text(
                'kcal',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 60, 
            child: LineChart(
              LineChartData(
                lineTouchData: const LineTouchData(enabled: false),
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(
                  show: false, 
                ),
                borderData: FlBorderData(
                  show: false, 
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 1.3),
                      FlSpot(1, 1.5),
                      FlSpot(2, 1.4),
                      FlSpot(4, 2),
                      FlSpot(6, 1.3),
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
          const SizedBox(height: 3),
        ],
      ),
    );
  }
}
