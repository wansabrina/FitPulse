import 'package:fitpulse/src/constants/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class NutritionSummary extends StatelessWidget {
  const NutritionSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
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
      child: Row(
        children: [
        
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                const Text(
                  "Macros",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 25),
                  child: SizedBox(
                    height: 120,
                    width: 200,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        PieChart(
                          PieChartData(
                            sectionsSpace: 2,
                            centerSpaceRadius: 65,
                            sections: _showingSections(),
                          ),
                        ),
                        const Positioned(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.flash_on, size: 18, color: Colors.blue),
                              SizedBox(height: 4),
                              Text(
                                "295.2 kkal",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 50),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _MacroIndicator(
                  color: blue500,
                  label: "Carbo",
                  value: "11.83g",
                ),
                SizedBox(height: 7),
                _MacroIndicator(
                  color: Colors.grey,
                  label: "Protein",
                  value: "0.35g",
                ),
                SizedBox(height: 7),
                _MacroIndicator(
                  color: Colors.yellowAccent,
                  label: "Fat",
                  value: "0.35g",
                ),
                SizedBox(height: 7),
                _MacroIndicator(
                  color: Colors.red,
                  label: "Fibre",
                  value: "1.97g",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> _showingSections() {
    return List.generate(4, (i) {
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue,
            value: 40,
            title: '',
            radius: 20,
          );
        case 1:
          return PieChartSectionData(
            color: Colors.yellow,
            value: 30,
            title: '',
            radius: 20,
          );
        case 2:
          return PieChartSectionData(
            color: Colors.grey,
            value: 15,
            title: '',
            radius: 20,
          );
        case 3:
          return PieChartSectionData(
            color: Colors.red,
            value: 15,
            title: '',
            radius: 20,
          );
        default:
          throw Error();
      }
    });
  }
}

class _MacroIndicator extends StatelessWidget {
  final Color color;
  final String label;
  final String value;

  const _MacroIndicator({
    required this.color,
    required this.label,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: neutral500,
            fontWeight: FontWeight.w500
          ),
        ),
      ],
    );
  }
}
