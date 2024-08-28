import 'package:fitpulse/src/constants/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum ChartType { day, week, month }

class StepsTotal extends StatelessWidget {
  final double totalSteps;
  final List<int> stepsData;
  final ChartType chartType;

  const StepsTotal({
    super.key,
    required this.totalSteps,
    required this.stepsData,
    required this.chartType,
  });

  @override
  Widget build(BuildContext context) {
    final formattedSteps = NumberFormat("#,##0", "en_US").format(totalSteps);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                formattedSteps,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Steps',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 180,
            child: BarChart(
              BarChartData(
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) =>
                          bottomTitleWidgets(value),
                      reservedSize: 28,
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: getRightInterval(),
                      getTitlesWidget: rightTitleWidgets,
                      reservedSize: 40,
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                barGroups: showingGroups(stepsData),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.grey[300],
                      strokeWidth: 1,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  double getRightInterval() {
    if (stepsData.any((element) => element > 1000)) {
      return 1000;
    } else {
      return 100;
    }
  }

  List<BarChartGroupData> showingGroups(List<int> stepsData) {
    return List.generate(stepsData.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: stepsData[index].toDouble(),
            color: blue500,
            width: 33,
            borderRadius: BorderRadius.circular(5),
          ),
        ],
      );
    });
  }

  Widget bottomTitleWidgets(double value) {
    const style = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );

    switch (chartType) {
      case ChartType.day:
        return _buildPaddedLabel(_getHourLabel(value), style);
      case ChartType.week:
        return _buildPaddedLabel(_getDayLabel(value), style);
      case ChartType.month:
        return _buildPaddedLabel(_getMonthLabel(value), style);
    }
  }

  String _getHourLabel(double value) {
    const hours = [
      '04.00',
      '06.00',
      '10.00',
      '14.00',
      '18.00',
      '20.00',
      '24.00'
    ];
    if (value >= 0 && value < hours.length) {
      return hours[value.toInt()];
    }
    return '';
  }

  String _getDayLabel(double value) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    if (value >= 0 && value < days.length) {
      return days[value.toInt()];
    }
    return '';
  }

  String _getMonthLabel(double value) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    if (value >= 0 && value < months.length) {
      return months[value.toInt()];
    }
    return '';
  }

  Widget _buildPaddedLabel(String label, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(label, style: style),
    );
  }

  Widget rightTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 12,
      color: Colors.black,
    );

    if (stepsData.any((element) => element > 1000)) {
      if (value % 1000 == 0) {
        return Text('${value.toInt()}',
            style: style, textAlign: TextAlign.center);
      } else {
        return Container();
      }
    }

    return Text(value.toInt().toString(),
        style: style, textAlign: TextAlign.center);
  }
}
